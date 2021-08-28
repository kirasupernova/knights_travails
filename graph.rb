class Graph
  attr_accessor :vertices

  def initialize(coordinate, destination)
    @destination = destination
    @visited = []
    @vertices = []
    create_graph(coordinate)
  end

  def create_graph(coordinate, destination = @destination, visited = @visited, vertices = @vertices)
    vertex = Vertex.new(coordinate)
    vertices.push(vertex)
    visited.push(coordinate)
    # return vertex if coordinate = destination
    vertex.possible_moves.each do |edge|
      if visited.include?(edge)
        vertex.edges.push(matching_vertex(edge))
      else
        vertex.edges.push(create_graph(edge))
      end
    end
    vertex
  end

  def matching_vertex(coordinate)
    matching = @vertices.filter { |vertex| vertex.coordinate == coordinate }
    matching[0]
  end

  def steps(queue = [[@vertices[0], @vertices[0]]], iterator = 0, destination = @destination)
    # this breadth-first function queues not only a vertex but also its parent
    child = queue[iterator][1]
    child.edges.each do |edge|
      queue.push([child, edge])
      return build_steps(queue) if edge.coordinate == destination
    end
    steps(queue,iterator + 1)
  end

  def build_steps(queue, steps = [])
    parent = queue[-1][0]
    child = queue[-1][1]
    steps.unshift(child.coordinate)
    return steps if queue.length < 2

    parents_parent = queue.find_index { |pair| pair[1] == parent }
    build_steps(queue[0..parents_parent], steps)
  end
end
