# frozen_string_literal: true

class RegistrationsController < ApplicationController
  before_action :check_user, only: %i[new create login loginuser]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      handle_login(user)

      redirect_to root_path, notice: 'Signup Successful!'
    else
      flash[:notice] = user.errors.full_messages.uniq.join(', ')

      render :new
    end
  end

  def login; end

  def loginuser
    user = User.find_by(username: params[:username])

    # Authenticate method comes from bcrypt gem for user model
    if user.present? && user.authenticate(params[:password])
      flash[:notice] = 'Signed in successfully!'
      handle_login(user)

      redirect_to root_path
    else
      flash[:notice] = 'Password is incorrect or no user found!'

      redirect_to registrations_login_path
    end
  end

  def signout
    cookies.delete :token

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :display_name, :password, :password_confirmation)
  end

  def handle_login(user)
    cookies.signed[:token] = user.id
  end

  def check_user
    redirect_to root_path if @user
    # logger.info = 'Already logged in!'
  end
end
