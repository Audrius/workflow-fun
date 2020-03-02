class EntryNode < Node

  def process(patient:)
    super
    next_node.process(patient: patient)
  end
end
