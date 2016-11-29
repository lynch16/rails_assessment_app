class Skill < ApplicationRecord
  belongs_to :workshop
  has_many :user_skills
  has_many :users, through: :user_skills

  validates :title, presence: true, uniqueness: true
end
