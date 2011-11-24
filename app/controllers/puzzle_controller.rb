
class PuzzleResponse
  attr_accessor :status, :table_index, :cell_index, :parent_value
  
  def initialize(table_index, cell_index, status, parent_value)
    @table_index = table_index
    @parent_value = parent_value
    @cell_index = cell_index
    @status = status
  end
end

class PuzzleController < ApplicationController
  
  def puzzle
    @puzzle = Puzzle.find(params[:id])
  rescue
    @puzzle = Puzzle.find(1)
    session[:puzzle_id] = @puzzle.id
  end
  
  def cell
    cell_index = params[:cell_index].to_i
    table_index = params[:table_index].to_i
    value = params[:value]
    puzzle = Puzzle.find(session[:puzzle_id])
    cell = puzzle.cells[table_index]
    row = table_index/3*3 + cell_index/3
    col = table_index%3*3 + cell_index%3
    
    if  (!cell.include? value ) && (!puzzle.rowdigits(row).include? value) && (!puzzle.coldigits(col).include? value)
      cell[cell_index] = value.to_s
      cell.save!
      result = PuzzleResponse.new(table_index, cell_index, 0, cell.cell_value)
    else 
      result = PuzzleResponse.new(table_index, cell_index, 1, cell.cell_value)
    end
    
 
    respond_to do |format|
      format.json {render:json => result.to_json}
    end
  end

end
