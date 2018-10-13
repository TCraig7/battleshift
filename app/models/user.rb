class User < ApplicationRecord
  validates_confirmation_of :password, on: :create
end
