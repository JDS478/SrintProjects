# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create; end

  def login; end

  def loginuser
    user = User.find_by(email: params[:email])
    # Authenticate method comes from bcrypt gem for user model
    if user.present? && user.authenticate(params[:password])
      flash[:notice] = 'Signed in successfully!'
      handle_login(user)

      redirect_to root_path
    else
      flash[:alert] = 'Password is incorrect or no user found!'

      redirect_to registrations_login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :display_name, :password, :password_confirmation)
  end

  def handle_login(user)
    session[:token].signed = user.id
  end
end
