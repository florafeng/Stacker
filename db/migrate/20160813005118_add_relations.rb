class AddRelations < ActiveRecord::Migration
  def change
  		add_foreign_key :user_querys, :users
  		add_foreign_key :so_responses, :users
  end
end
