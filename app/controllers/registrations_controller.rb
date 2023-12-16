# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def index; end

  def create; end

  private

  def user_params
    params.require(:user).permit(:username, :display_name, :password, :password_confirmation)
  end
end
