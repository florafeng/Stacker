class FixSavedPost < ActiveRecord::Migration
  def change
  	remove_column :saved_posts, :q_link, :text
  	add_column :saved_posts, :q_link, :string
  end
end
