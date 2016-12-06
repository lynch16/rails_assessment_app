class Skill < ApplicationRecord
  belongs_to :workshop, optional: true
  has_many :user_skills
  has_many :users, through: :user_skills

  validates :title, presence: true, uniqueness: true

  def self.unassigned
    self.where(workshop_id: nil)
  end

  def self.experts(skill)
    User.joins(:user_skills).where(user_skills: {skill_level: :expert, skill_id: skill.id})
  end
end
