class Puzzle < ActiveRecord::Base
  
  has_many :cells
  has_many :puzzleValueHistories
  
  def rowdigits(row)
    s = Array.new
    9.times do |i| 
      if (puzzleValueHistories.where(:cell_index => BoxOfIndex[row*9+i], :value_index => i%3+row%3*3).exists?)
        s << puzzleValueHistories.where(:cell_index => BoxOfIndex[row*9+i], :value_index => i%3+row%3*3).first.value
      else
        s << cells[BoxOfIndex[row*9+i]][i%3+row%3*3]
      end
    end
    s
  end
  
  def coldigits(col)
    s = Array.new
    9.times do |i| 
      if(puzzleValueHistories.where(:cell_index => BoxOfIndex[i*9+col], :value_index => i%3*3+col%3).exists?)
        s << puzzleValueHistories.where(:cell_index => BoxOfIndex[i*9+col], :value_index => i%3*3+col%3).first.value
      else
        s << cells[BoxOfIndex[i*9+col]][i%3*3+col%3]
      end
    end
    s
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
  
  def contains? (cell_index, value_index)
    puzzleValueHistories.where(:cell_index => cell_index, :value_index => value_index).exists?
  end
  
  def history(cell_index, value_index)
    history = puzzleValueHistories.where(:cell_index => cell_index, :value_index => value_index).first.value
  end
  
end
