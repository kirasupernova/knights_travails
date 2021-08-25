require './vertex.rb'
require './graph.rb'

graph = Graph.new([2,2], [2,7])
graph.vertices.each do |vertex|
  print "#{vertex.coordinate}: "
  vertex.edges.each do |edge|
    print edge.coordinate
  end
  print "\n"
end
