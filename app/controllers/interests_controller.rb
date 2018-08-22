class InterestsController < ApplicationController
  def show
  end

  def create
  end

  def index
    if user_signed_in?
      @user = User.find(current_user.id)
      @rides = @user.rides
    else
      redirect_to '/users/sign_in'
    end
  end

  def destroy
    @interest = Interest.where("user_id = ? AND ride_id = ?", current_user.id, params[:id].to_i)
    @interest[0].destroy
    @ride = Ride.find(params[:id].to_i)
    @ride.seats_available += 1
    if @ride.save
      redirect_to '/interests'
    else
      @errors = @ride.errors.messages
      render "index"
    end
  end
end
