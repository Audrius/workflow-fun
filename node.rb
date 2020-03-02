class Node
  attr_accessor :name, :nodes

  def initialize(name: self.class.name)
    @name = name
    @nodes = []
  end

  def process(patient:)
    puts "Processing Node #{self.class.name} #{patient.name}"
  end

  def next_node
    nodes&.first
  end

  def left_node
    nodes&.first
  end

  def right_node
    nodes&.last
  end
end
