
class PuzzleController < ApplicationController
  
  def puzzle
    puzzle = Puzzle.new("6..18..94 798...2.. ..4.9.3.. .5.9.82.3 6.......4 2.34.5.6. ..7.1.8.. ..1...573 58..36..1")
    @cells= puzzle.cells 
    @puzzle = puzzle
    session[:puzzle] = @puzzle
  end
  
  def cell
    cell_index = params[:cell_index].to_i
    table_index = params[:table_index].to_i
    value = params[:value]
    @puzzle = session[:puzzle]
    cell = @puzzle.cells[table_index]
    row = table_index/3*3 + cell_index/3
    col = table_index%3*3 + cell_index%3
    result = ''
    if  (!cell.include? value ) && (!@puzzle.rowdigits(row).include? value) && (!@puzzle.coldigits(col).include? value)
      cell[cell_index] = value.to_s
      result = 'Good Move!'
    else 
      result = 'I don''t think it will work'
    end
 
    respond_to do |format|
      format.json {render:json => result.to_json}
      put 'abc'
    end
  end

end
