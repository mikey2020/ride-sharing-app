class RidesController < ApplicationController
  include RidesHelper

  before_action :authenticate_user!

  def index
    @rides = Ride.order(:created_at).where("seats_available > ?", 0)
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
      render "new"
    end
  end

  def update
    if request.request_method == 'PATCH'
      book_ride
    else
      update_ride
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

  private

  def ride_params
    params.require(:ride).permit(:destination, :origin, :take_off, :seats_available, :ride_type)
  end
end
