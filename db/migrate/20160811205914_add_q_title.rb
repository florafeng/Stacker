class AddQTitle < ActiveRecord::Migration
  def change
  	create_table :q_arraies do |t|
  		t.string :q_arraies
  	end
  end
end
