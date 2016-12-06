class Workshop < ApplicationRecord
  has_many :skills
  has_many :users, through: :skills
  belongs_to :officer, class_name: 'User', foreign_key: 'user_id'

  accepts_nested_attributes_for :skills, allow_destroy: true,  :reject_if => proc { |attributes| attributes['title'].blank? }

  validates :name, presence: :true, uniqueness: :true

  def skills_attributes=(skills_attributes)
    skills_attributes.values.each do |skill_attributes|
      unless skill_attributes[:title].blank?
        self.skills.build(skill_attributes)
      end
    end
  end

  def self.total_workshops
    count
  end

  def officer=(officer)
    self.skills.each do |skill|
      if !officer.skills.include?(skill)
        officer.skills << skill
      end
      UserSkill.find_by(user_id: officer.id, skill_id: skill.id).make_expert
    end
    officer
  end
end
