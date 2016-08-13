class FixTablesTheLastTime < ActiveRecord::Migration
  def up
    drop_table :so_responses
    drop_table :user_querys
    remove_column :saved_posts, :question_id, :integer
    remove_column :saved_posts, :answer_id, :integer
    remove_column :saved_posts, :user_id, :intger
    add_column :saved_posts, :user_id, :integer,  references: :users
    add_column :saved_posts, :q_link, :text
  end
  def down
    create_table :so_responses do |t|
      t.string :so_question_title
      t.string :so_question_body
      t.string :so_answer_body
      t.timestamps
    end
    create_table :user_querys do |t|
      t.text :user_query_text
      t.timestamps
    end
    add_column :saved_posts, :question_id, :integer
    add_column :saved_posts, :user_id, :integer
    add_column :saved_posts, :answer_id, :integer
    remove_column :saved_posts, :user_id, :integer
    remove_column :saved_posts, :q_link, :text
  end
end
