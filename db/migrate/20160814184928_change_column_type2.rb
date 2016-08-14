class ChangeColumnType2 < ActiveRecord::Migration
  def change
  	change_column :saved_posts, :q_link, :text
  end
end
