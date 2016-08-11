class AddSearchQuerys < ActiveRecord::Migration
  def change
  	add_column :saved_posts, :query_text, :string
  end
end
