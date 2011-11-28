
class PuzzleResponse
  attr_accessor :status, :table_index, :cell_index
  
  def initialize(table_index, cell_index, statuse)
    @table_index = table_index
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
    
    if  (!cell.include? value ) && (!puzzle.rowdigits(row).include? value) && (!puzzle.coldigits(col).include? value) || value == '.'
      cell.cell_value = String.new(cell.replace(cell_index, value))
      cell.save
      result = PuzzleResponse.new(table_index, cell_index, 0)
      if !PuzzleValueHistory.where(:puzzle_id => puzzle.id, :cell_index=>table_index, :value_index=> cell_index).exists? 
        puzzle.puzzleValueHistories.create(:puzzle_id => puzzle.id, :cell_index => table_index, :value_index=> cell_index, :value=> value)
      end
    else 
      result = PuzzleResponse.new(table_index, cell_index, 1)
    end
    
 
    respond_to do |format|
      format.json {render:json => result.to_json}
    end
  end

end
