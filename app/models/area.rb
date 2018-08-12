class Area < ApplicationRecord
  has_many :user_areas
  has_many :users, through: :user_areas
  validates :name, uniqueness: true, presence: true
end
