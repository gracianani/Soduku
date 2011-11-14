class Puzzle 
  def initialize(values)
    #remove all invalid inputs
    values.gsub!(/\s/,"")
    
    #validate initial value
    #cells should have length equals to 9
   
    raise Invalid, "Grid is the wrong size #{values.length}" unless values.length == 81

    @cells = Array.new
    9.times do |i|
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
  
  def rowdigits(row)
    s = Array.new
    9.times do |i| 
      s << @cells[BoxOfIndex[row*9+i]][i%3+row%3*3]
    end
    s
  end
  
  def coldigits(col)
    s = Array.new
    9.times do |i| 
      s << @cells[BoxOfIndex[i*9+col]][i%3*3+col%3]
    end
    s
  end
  
  def celldigits(cell)
  end
  
  BoxOfIndex = [
    0,0,0,1,1,1,2,2,2,
    0,0,0,1,1,1,2,2,2,
    0,0,0,1,1,1,2,2,2,
    3,3,3,4,4,4,5,5,5,
    3,3,3,4,4,4,5,5,5,
    3,3,3,4,4,4,5,5,5,
    6,6,6,7,7,7,8,8,8,
    6,6,6,7,7,7,8,8,8,
    6,6,6,7,7,7,8,8,8
  ]
  
end
