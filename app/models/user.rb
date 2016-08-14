class User < ActiveRecord::Base

	has_many :saved_posts
    has_secure_password
  
end