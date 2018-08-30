module RidesHelper
  def get_user_details(users)
    users_details = []
    users.each do |user|
      users_details.push({ username: user.username, email: user.email })
    end
    users_details
  end

  def resp_message
    if @ride.ride_type == 'offer'
      flash[:success] = "Your seat has been booked"
      NotificationMailer.with(user: @ride.user, current_user: current_user).notify_email.deliver_later
    else
      NotificationMailer.with(user: @ride.user).notify_rider.deliver_later
    end
  end

  def no_seats_available?
    @ride.seats_available == 0
  end

  def send_riders_list_to_driver
    if no_seats_available?
      NotificationMailer.with(user: @ride.user, users: users).send_riders_list.deliver_later
    end
  end
end
