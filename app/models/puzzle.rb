class Puzzle 
  def initialize(values)
    #validate initial value
    
    #cells should have length equals to 9
    raise Invalid, "Grid is the wrong size" unless values.length == 81

    @cells = Array.new
    9.times do |i|
      #
      @cells.push(Cell.new(values[i*9..i*9+8]))
    end
  end
  
  def cells
    @cells
  end
  
  def cells=(new_cells)
    @cells = new_cells
  end
  
  def [] (cell_index, value_index)
    cell = @cells[cell_index]
    cell[value_index]
  end
  ROWS = 3
  COLUMNS = 3
  
end
