class CreatePuzzleValueHistories < ActiveRecord::Migration
  def change
    create_table :puzzle_value_histories do |t|
      t.integer :puzzle_id 
      t.integer :cell_index
      t.integer :value_index
      t.string :value
      t.timestamps
    end
  end
end
