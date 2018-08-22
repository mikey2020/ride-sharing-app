class NotificationMailer < ApplicationMailer
  def notify_email
    @user = params[:user]
    @current_user = params[:current_user]
    mail(to: @user.email, subject: 'Ride update')
  end

  def send_riders_list
    @user = params[:user]
    @users = params[:users]
    mail(to: @user.email, subject: 'Final Ride update')
  end

  def notify_users
    @ride = params[:ride]
    @users = params[:users]
    @users.each do |user|
      mail(to: user.email, subject: 'Ride Cancelled')
    end
  end
end
