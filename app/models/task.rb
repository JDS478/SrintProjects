# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  belongs_to :project
end
