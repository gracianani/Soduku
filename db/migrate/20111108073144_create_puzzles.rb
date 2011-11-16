class CreatePuzzles < ActiveRecord::Migration
  def self.up
    create_table :puzzles do |t|
      t.primary_key   :id
      t.string :name
      t.integer :difficuty_level
      t.timestamps 
    end
    
    create_table :cells do |t|
      t.integer :puzzle_id 
      t.string  :cell_value
      t.integer :cell_index
      t.timestamps
    end
  end
  
  def self.down
    drop_table :cells
    drop_table :puzzles
  end
end
