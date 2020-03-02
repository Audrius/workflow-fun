class EntryNode < Node

  def process(patient:)
    puts
    super
    next_node.process(patient: patient)
  end
end
