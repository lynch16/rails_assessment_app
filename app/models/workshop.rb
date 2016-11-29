class Workshop < ApplicationRecord
  has_many :skills
  has_many :users, through: :skills
  belongs_to :officer, class_name: 'User', foreign_key: 'user_id'

  accepts_nested_attributes_for :skills, allow_destroy: true

  validates :name, presence: :true, uniqueness: :true

  def skills_attributes=(skillss_attributes)
    skillss_attributes.values.each do |skill_attributes|
      unless skill_attributes[:title].blank?
        self.skills.build(skill_attributes)
      end
    end
  end
end
