class SavedpostColumn < ActiveRecord::Migration
  def change
  	add_column :saved_posts, :q_title, :string
  end
end
