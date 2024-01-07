# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_user

  private

  def set_user
    return unless cookies[:token]

    @user = User.find(cookies.signed[:token])
  end
end
