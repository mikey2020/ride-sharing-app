class RidesController < ApplicationController
  include RidesHelper

  before_action :authenticate_user!

  def index
    Ride.available_rides
  end

  def new
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
      render "new", status: 400
    end
  end

  def update
    @ride = Ride.find(params[:id])
    if @ride.update(ride_params)
      redirect_to '/rides'
    else
      render 'edit', status: 400
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

  def book_ride
    @ride = Ride.find(params[:id])
    @ride.seats_available -= 1
    if @ride.save
      Interest.create(user_id: current_user.id, ride_id: @ride.id)
      resp_message
      users = get_user_details(@ride.users)
      send_riders_list_to_driver
      redirect_to '/rides/'
    else
      @errors = @ride.errors.messages
      flash[:error] = @errors[0]
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:destination, :origin, :take_off, :seats_available, :ride_type)
  end
end
