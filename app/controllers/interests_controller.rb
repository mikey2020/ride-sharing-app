class InterestsController < ApplicationController
  include InterestsHelper
  before_action :authenticate_user!

  def show
  end

  def index
    @user = User.find(current_user.id)
    @rides = @user.rides
  end

  def destroy
    @interest = Interest.indicated(current_user.id, params[:id].to_i)
    if @interest.empty?
      flash[:error] = "Interest not found"
      redirect_to '/interests', status: 404
    else
      @interest[0].destroy
      update_seats_number
      redirect_to '/rides'
    end
  end
end
