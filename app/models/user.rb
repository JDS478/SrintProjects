# frozen_string_literal: true

# Virtual attributes:
# password:string
# password_comfirmation:string

class User < ApplicationRecord
  has_secure_password

  has_many :owned_projects, class_name: 'Project', foreign_key: 'admin_id'

  has_many :authored_tasks, class_name: 'Task', foreign_key: 'author_id'
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id'
end
