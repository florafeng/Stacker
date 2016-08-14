class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :saved_posts, :q_title, :text
  	change_column :saved_posts, :query_text, :text
  end
end
