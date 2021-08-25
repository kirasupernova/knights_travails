class Graph
  attr_accessor :visited, :root, :destination, :vertices

  def initialize(coordinate, destination)
    @destination = destination
    @visited = []
    @vertices = []
    create_graph(coordinate)
  end

  def create_graph(coordinate, destination = @destination, visited = @visited, vertices = @vertices)
    return matching_vertex(coordinate) if visited.include?(coordinate)

    vertex = Vertex.new(coordinate)
    vertices.push(vertex)
    return vertex if visited.include?(coordinate)

    visited.push(coordinate)
    vertex.possible_moves.each do |edge|
      vertex.edges.push(create_graph(edge))
    end
    vertex
  end

  def matching_vertex(coordinate)
    matching = @vertices.filter { |vertex| vertex.coordinate == coordinate }
    matching[0]
  end
end
