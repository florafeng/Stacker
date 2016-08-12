class ChangePasswordColumn < ActiveRecord::Migration
  def change
  	change_column :users, :password, :password_digest
  end
end
