class Workshop < ApplicationRecord
  has_many :skills
  has_many :users, through: :skills
  belongs_to :officer, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: :true, uniqueness: :true

end
