class Ride < ApplicationRecord
  enum ride_type: [:offer, :request]
  has_many :interests
  belongs_to :user
  has_many :users, through: :interests
  validates :origin, presence: true
  validates :destination, presence: true
  validates :take_off, presence: true
  validates :seats_available, presence: true
end
