class GraphInitial

  attr_accessor :nodes
  attr_accessor :edges

  def initialize(nodes = [], edges = [])
    @nodes = nodes
    @edges = edges
  end

  def add_node(node)
    nodes << node
    node.graph = self
  end

  def add_edge(from, to, weight)
    edges << Edge.new(from, to, weight)
  end

  def minimum_spanning_tree
    included_nodes = []
    excluded_nodes = self.nodes.to_a
    included_edges = []
    included_nodes << excluded_nodes.pop # randomly add first node to set

    # while there are
    while excluded_nodes.count > 0
      #find the min edge connecting included to excluded
      #add the 'from' node of that edge to the included nodes (remove it from the excluded nodes)
      edge = min_edge(included_nodes, excluded_nodes)
      included_edges << edge
      node = excluded_nodes.find { |n| n == edge.node2 }
      included_nodes << node
      excluded_nodes.delete(node)
    end


    included_edges.each do |edge|
      puts "(edge)" + edge.node1.name.to_s + " -> " + edge.node2.name.to_s + "(" + edge.weight.to_s + ")"

    end

    return included_edges

  end

  #return the minimum edge connecting X to V
  def min_edge(nodes_in_tree, nodes_remaining)
    valid_edges = []
    nodes_in_tree.each do |node|
      connecting_edges = self.edges.find_all{ |e| e.node1 == node }
      unless connecting_edges.nil?
        connecting_edges.each do |edge|
          if nodes_remaining.include?(edge.node2)
            valid_edges << edge
          end
        end
      end

    end

    return valid_edges.min_by(&:weight)

  end

  def print_graph
    puts "printing graph"
    self.nodes.each do |node|
      puts "Node (" + node.name + ")"
    end
  end


end