# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :admin, class_name: 'User'
end
