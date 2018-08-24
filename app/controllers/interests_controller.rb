class InterestsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def create
  end

  def index
    @user = User.find(current_user.id)
    @rides = @user.rides
  end

  def destroy
    @interest = Interest.indicated(current_user.id, params[:id].to_i)
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
