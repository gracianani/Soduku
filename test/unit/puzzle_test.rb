require 'test_helper'

class PuzzleTest < ActiveSupport::TestCase
  test "the truth" do
      puzzle = Puzzle.create( :name => "see me loo", :difficuty_level => 1 )
      puzzle.cells.create( :puzzle_id => puzzle.id, :cell_index => 0, :cell_value => '123' )
      assert_nil puzzle.cells[0][2]
      #             { :puzzle_id => @puzzle.id, :cell_index => 1, :cell_value => "123456789" }])
      
  end
end