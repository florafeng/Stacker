class User < ActiveRecord::Base

	has_many :saved_posts
end