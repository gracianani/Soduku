
class PuzzleController < ApplicationController
  
  def puzzle
    puzzle = Puzzle.new("123456789123456789123456789123456789123456789123456789123456789123456789123456789")
    @cells= puzzle.cells
    @puzzle = puzzle
    session[:puzzle] = @puzzle
  end
  
  def cell
    cell_index = params[:cell_index]
    table_index = params[:table_index]
    value = params[:value]
    @puzzle = session[:puzzle]
    cell = @puzzle.cells[0]
    result = ''
    if !cell.include? value
      cell[cell_index.to_i] = value.to_s
      result = 'Good Move!'
    else 
      result = 'I don''t think it will work'
    end

    respond_to do |format|
      
      format.json {render:json => result.to_json}
    end
  end

end
