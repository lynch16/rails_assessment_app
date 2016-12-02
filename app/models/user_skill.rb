class UserSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :user

  enum skill_level: [:novice, :pro, :expert]
end
