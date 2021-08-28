class Knight
  attr_accessor :position, :last_moves

  def moves(start = @position, finish)
    @position = finish
    possible_moves = Graph.new(start, finish)
    @last_moves = possible_moves.steps
    puts "You made it in #{@last_moves.length} moves! Here's your path:"
    @last_moves.each do |move|
      print move
      print "\n"
    end
  end
end
