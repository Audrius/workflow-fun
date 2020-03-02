class Workflow
  attr_accessor :name, :nodes

  def initialize(name:, nodes:)
    @name = name
    @nodes = nodes
  end

  def add_edge(node1, node2)
    node1.nodes << node2
  end

  def process_patient(patient:)
    entry_node.process(patient: patient)
  end

  def entry_node
    nodes.find{|node| node.class == EntryNode }
  end
end
