class User < ActiveRecord::Base

	has_many :user_querys
  has_secure_password
  
end