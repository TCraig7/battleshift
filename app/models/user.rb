require 'bcrypt'

class User < ApplicationRecord
  validates_confirmation_of :password, on: :create
  has_secure_password
end
