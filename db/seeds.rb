# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
puzzle = Puzzle.create :name => "Seemeloo's Sudoku", :difficuty_level => 1

Cell.create([{ :puzzle_id => puzzle.id, :cell_index=> 0, :cell_value => "6..18..94" }, 
             { :puzzle_id => puzzle.id, :cell_index=> 1, :cell_value => "798...2.." },
             { :puzzle_id => puzzle.id, :cell_index=> 2, :cell_value => "..4.9.3.." },
             { :puzzle_id => puzzle.id, :cell_index=> 3, :cell_value => ".5.9.82.3" }, 
             { :puzzle_id => puzzle.id, :cell_index=> 4, :cell_value => "6.......4" }, 
             { :puzzle_id => puzzle.id, :cell_index=> 5, :cell_value => "2.34.5.6." }, 
             { :puzzle_id => puzzle.id, :cell_index=> 6, :cell_value => "..7.1.8.." }, 
             { :puzzle_id => puzzle.id, :cell_index=> 7, :cell_value => "..1...573" }, 
             { :puzzle_id => puzzle.id, :cell_index=> 8, :cell_value => "58..36..1" }])