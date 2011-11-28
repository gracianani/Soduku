class PuzzleValueHistory < ActiveRecord::Base
  belongs_to :puzzle
  def [] (cell_index, value_index)
    value
  end
  
  def []= (cell_index, value_index, value)
    this.value = value
  end
end
