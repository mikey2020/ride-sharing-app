class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  def self.indicated(user_id, ride_id)
    Interest.where("user_id = ? AND ride_id = ?", user_id, ride_id)
  end
end
