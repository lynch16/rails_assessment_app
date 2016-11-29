class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :name, presence :true, uniqueness :true
end
