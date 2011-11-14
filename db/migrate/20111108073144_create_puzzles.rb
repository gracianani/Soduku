class CreatePuzzles < ActiveRecord::Migration
  def up
    create_table :puzzle_cells do |t|
      t.string :name
    end
  end
  
end
