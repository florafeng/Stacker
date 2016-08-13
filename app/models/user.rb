class User < ActiveRecord::Base

	has_many :user_querys
	has_many :so_responses
    has_secure_password
  
end