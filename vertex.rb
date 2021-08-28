class Vertex
  attr_accessor :coordinate, :edges

  def initialize(coordinate)
    @coordinate = coordinate
    @edges = []
  end

  def possible_moves(array = @coordinate)
    move1 = [array[0] - 1, array[1] - 2]
    move2 = [array[0] - 2, array[1] - 1]
    move3 = [array[0] + 1, array[1] + 2]
    move4 = [array[0] + 2, array[1] + 1]
    move5 = [array[0] - 1, array[1] + 2]
    move6 = [array[0] - 2, array[1] + 1]
    move7 = [array[0] + 1, array[1] - 2]
    move8 = [array[0] + 2, array[1] - 1]
    [move1, move2, move3, move4, move5, move6, move7, move8].filter do |move|
      move[0].between?(1, 8) && move[1].between?(1, 8)
    end
  end
end
