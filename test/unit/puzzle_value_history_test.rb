require 'test_helper'

class PuzzleValueHistoryTest < ActiveSupport::TestCase
  test "the truth" do
     PuzzleValueHistory.create(:puzzle_id => 1, :cell_index => 1, :value_index => 1, :value => '8')
     assert_equal true, PuzzleValueHistory.where(:puzzle_id => 1, :cell_index => 1, :value_index => 1).exists?
  end
end
