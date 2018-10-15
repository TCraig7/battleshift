require 'bcrypt'

class User < ApplicationRecord
  before_create :create_activation_digest, :create_api_key
  
  # validates_presence_of :name
  # validates_presence_of :email
  # validates_presence_of :password
  validates_confirmation_of :password, on: :create
  
  has_secure_password

  enum status: ['inactive', 'active']

  def activate_account
    self.update!(status: 'active')
  end

  private

    def create_activation_digest
      self.activation_digest = SecureRandom.uuid
    end

    def create_api_key
      self.api_key = SecureRandom.uuid
    end
end
