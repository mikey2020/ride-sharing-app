class Ride < ApplicationRecord
  enum ride_type: [:offer, :request]
  has_many :interests
  belongs_to :user
  has_many :users, through: :interests
  validates :origin, presence: true
  validates :destination, presence: true
  validates :take_off, presence: true
  validates :seats_available, presence: true

  def display_ride_type
    if self.ride_type == 'offer'
      "#{self.seats_available} seats available"
    else
      "#{self.seats_available} seats wanted"
    end
  end

  def self.available_rides
    Ride.order(:created_at).where("seats_available > ?", 0)
  end
end
