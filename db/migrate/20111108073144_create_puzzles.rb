class CreatePuzzles < ActiveRecord::Migration
  def up
    create_table :puzzles do |t|

      t.timestamps
    end
  end
end
