class RidesController < ApplicationController
  def index
    if user_signed_in?
      @rides = Ride.order(:created_at).where("seats_available > ?", 0)
    else
      redirect_to '/users/sign_in'
    end
  end

  def new
    if user_signed_in?
      render "new"
    else
      redirect_to "/users/sign_in"
    end
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.ride_type = params[:ride_type].to_i
    @ride.user_id = current_user.id
    if @ride.save
      flash[:notice] = "Ride posted successfully"
      redirect_to "/rides/"
    else
      @errors = @ride.errors.messages
      render "new"
    end
  end

  def update
    if request.request_method == 'PATCH'
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
    else
      @ride = Ride.find(params[:id])
      if @ride.update(ride_params)
        redirect_to '/rides'
      else
        render 'edit'
      end
    end
  end

  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy
    
    users = get_user_details(@ride.users)
    if @ride.users != []
      NotificationMailer.with(ride: @ride, users: users).notify_users.deliver_later
    end

    redirect_to '/rides'
  end

  def get_user_details(users)
    users_details = []
    users.each do |user|
      users_details.push({ username: user.username, email: user.email })
    end
    users_details
  end

  private

  def ride_params
    params.require(:ride).permit(:destination, :origin, :take_off, :seats_available, :ride_type)
  end
end
