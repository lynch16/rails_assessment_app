class UserSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :user

  enum skill_level: [:novice, :pro, :expert]

  def make_expert
    self.skill_level = :expert
    self.save
  end
end
