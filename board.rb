class Board
  attr_accessor :all_coordinates, :board

  def initialize
    @all_coordinates = [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(2).to_a
    @board = create_board
    @board.each do |row|
      row.each { |el| print "#{el} " }
      print "\n"
    end
  end

  def create_board
    board = []
    8.times { board.push([]) }
    board.each { |row| 8.times { row.push('[ ]') } }
    board.each_with_index { |board_row, index| board_row.unshift(index + 1) }
    board.unshift(['   1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ', ' 6 ', ' 7 ', ' 8 '])
  end

  def to_s
    string = ""
    @board.each do |row|
      row.each do |square|
        string.concat(square)
      end
      string.concat("\n")
    end
    string
  end


  def possible_combinations(array)
    move1 = [array[0] - 1, array[1] - 2]
    move2 = [array[0] - 2, array[1] - 1]
    move3 = [array[0] + 1, array[1] + 2]
    move4 = [array[0] + 2, array[1] + 1]
    move5 = [array[0] - 1, array[1] + 2]
    move6 = [array[0] - 2, array[1] + 1]
    move7 = [array[0] + 1, array[1] - 2]
    move8 = [array[0] + 2, array[1] - 1]
    [move1, move2, move3, move4, move5, move6, move7, move8].filter do |move| 
      move[0].between?(0,7) && move[1].between?(0,7)
    end
  end

  def build_graph(coordinates, vertices)
    coordinates.each do |coordinate|
      vertex = Vertex.new(coordinate)
      vertices.push(vertex)
    end
  end

  def connect_graph(vertices)
    vertices.each do |vertex|
      connections = possible_combinations(vertex.coordinate).map do |coordinate|
        vertices.select { |connected_vertex| connected_vertex.coordinate == coordinate }
      end
      vertex.moves.push(connections)
      vertex.moves.flatten(1)
    end
    nil
  end
end
