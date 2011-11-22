class PuzzleController < ApplicationController
  
  def puzzle
    @puzzle = Puzzle.find(1)
  end
  
  def change_level
    respond_to do |format|
      format.html { @puzzle=Puzzle.find(2) ;}
    end
  end
  def cell
    cell_index = params[:cell_index].to_i
    table_index = params[:table_index].to_i
    value = params[:value]
    puzzle = Puzzle.find(1)
    cell = puzzle.cells[table_index]
    row = table_index/3*3 + cell_index/3
    col = table_index%3*3 + cell_index%3
    result = ''
    if  (!cell.include? value ) && (!puzzle.rowdigits(row).include? value) && (!puzzle.coldigits(col).include? value)
      cell[cell_index] = value.to_s
      result = 0
    else 
      result = 1
    end
 
    respond_to do |format|
      format.json {render:json => result.to_json}
    end
  end

end
