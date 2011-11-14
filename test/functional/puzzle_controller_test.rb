require 'test_helper'

class PuzzleControllerTest < ActionController::TestCase
  test "should get puzzle" do
    get :puzzle
    assert_response :success
  end

end
