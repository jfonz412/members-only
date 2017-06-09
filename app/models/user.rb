class User < ApplicationRecord
	validates :name, presence: true, length: { minimum: 5, maximum: 25 }
	validates :email, presence: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
