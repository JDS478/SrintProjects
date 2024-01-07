# frozen_string_literal: true

require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  test 'should get login' do
    get :login

    assert_response :success
  end

  test 'should get signup/new' do
    get :new

    assert_response :success
  end

  # test 'should create new user' do
  #   get :login

  #   assert_response :success
  # end
end
