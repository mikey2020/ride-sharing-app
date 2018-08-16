class RidesController < ApplicationController
  def new
    if user_signed_in?
        render "new"
    else
        redirect_to "/users/sign_in"
    end
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.ride_type = params[:ride_type].to_i
    if @ride.save
      flash[:notice] = "Ride posted successfully"
      render "welcome/index"
    else
      @errors = @ride.errors.messages
      render "new"
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:destination, :origin, :take_off, :seats_available, :ride_type)
  end
end
