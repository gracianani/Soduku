class Cell < ActiveRecord::Base

  belongs_to :puzzle
  
  def [] (index)
    cell_value.split(//)[index.to_i]
  end

  def []= (index, value)
    cell_value[index.to_i] = value.to_s
  end
  
  def replace (index, value)
    new_value = String.new(cell_value)
    new_value[index.to_i] = value.to_s
    new_value
  end
  
  def include? (value)
    #puts puzzle.object_id
    (cell_value.include? value.to_s) || (PuzzleValueHistory.where(:puzzle_id=> puzzle_id, :cell_index => cell_index, :value=> value.to_s).exists?)
  end
end