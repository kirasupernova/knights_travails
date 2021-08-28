require './knight.rb'
require './vertex.rb'
require './graph.rb'
require './board.rb'

knight = Knight.new
board = Board.new
puts board
print 'Starting position: '
start = gets.split(',').map(&:to_i)
print 'Final position: '
finish = gets.split(',').map(&:to_i)
knight.moves(start, finish)
knight.last_moves.each_with_index do |move, index|
  move_number = "[#{index + 1}]"
  move_number = '[X]' if index.zero?
  board.board[move[0] - 1][move[1] - 1] = move_number
end
puts board
