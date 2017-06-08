class User < ApplicationRecord
	validates :name, presence: true, length: { minimum: 5, maximum: 25 }
	validates :email, presence: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
