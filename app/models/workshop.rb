class Workshop < ApplicationRecord
  has_many :skills
  has_many :users, through: :skills
  belongs_to :officer, class_name: 'User', foreign_key: 'user_id'

  accepts_nested_attributes_for :skills, allow_destroy: true,  :reject_if => proc { |attributes| attributes['title'].blank? }

  validates :name, presence: :true, uniqueness: :true

  def self.total_workshops
    count
  end

  def user_id=(officer_id)
    officer = User.find_by(id: officer_id)
    self.officer = officer
    self.skills.each do |skill|
      if !officer.skills.include?(skill)
        officer.skills << skill
      end
      UserSkill.find_by(user_id: officer.id, skill_id: skill.id).make_expert
    end
    officer
  end

  def expert?(user)
      self.skills.all? { |skill| Skill.experts(skill).include?(user) }
  end
end
