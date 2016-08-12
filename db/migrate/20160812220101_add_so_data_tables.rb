class AddSoDataTables < ActiveRecord::Migration
  def change
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
  end
end
