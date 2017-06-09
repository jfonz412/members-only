class User < ApplicationRecord
  attr_accessor :remember_token
	validates :name, presence: true, length: { minimum: 5, maximum: 25 }
	validates :email, presence: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

  has_many :posts

  # Returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # takes remember token from the cookie and compares it with remember digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # returns a random string for my token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil) #user.remember_token is replaced when new token is needed
  end
end
