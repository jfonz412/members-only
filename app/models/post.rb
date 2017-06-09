class Post < ApplicationRecord
	validates :title, presence: true, length: {minimum: 3, maximum: 35}
	validates :body,  presence: true, length: {minimum: 3, maximum: 500}
	validates :user_id, presence: true

	belongs_to :user
end
