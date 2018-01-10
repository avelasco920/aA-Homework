require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []
  vertices.each do |vertex|
    queue.push(vertex) if vertex.in_edges.empty?
  end
  until queue.empty?
    current = queue.shift
    sorted.push(current)
    # current.out_edges.each do |edge|
    #   if edge.to_vertex.in_edges.length == 1
    #     queue.push(edge.to_vertex)
    #   end
    #   edge.destroy!
    # end

    until current.out_edges.empty?
      edge = current.out_edges.first
      to_vertex = edge.to_vertex
      edge.destroy!

      if to_vertex.in_edges.empty?
        queue << to_vertex
      end
    end
  end
  return [] if sorted.length < vertices.length
  sorted
end
