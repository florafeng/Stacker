class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
    end
    create_table :saved_posts do |t|
      t.integer :question_id
      t.integer :answer_id
      t.integer :user_id
      t.timestamps 
    end
  end
end
