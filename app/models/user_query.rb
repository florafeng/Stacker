class UserQuery < ActiveRecord::Base

  belongs_to :user
  has_many :so_responses
  
end