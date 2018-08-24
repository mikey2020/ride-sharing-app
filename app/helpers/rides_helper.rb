module RidesHelper
  def update_ride
    @ride = Ride.find(params[:id])
    if @ride.update(ride_params)
      redirect_to '/rides'
    else
      render 'edit'
    end
  end

  def book_ride
    @ride = Ride.find(params[:id])
    @ride.seats_available -= 1
    if @ride.save
      flash[:success] = "Your seat has been booked"
      Interest.create(user_id: current_user.id, ride_id: @ride.id)
      NotificationMailer.with(user: @ride.user, current_user: current_user).notify_email.deliver_later
      users = get_user_details(@ride.users)
      if @ride.seats_available == 0
        NotificationMailer.with(user: @ride.user, users: users).send_riders_list.deliver_later
      end
      redirect_to '/rides/'
    else
      @errors = @ride.errors.messages
      flash[:error] = @errors[0]
    end
  end

  def get_user_details(users)
    users_details = []
    users.each do |user|
      users_details.push({ username: user.username, email: user.email })
    end
    users_details
  end
end
