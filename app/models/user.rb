# frozen_string_literal: true

# Virtual attributes:
# password:string
# password_comfirmation:string

class User < ApplicationRecord
  has_secure_password
end
