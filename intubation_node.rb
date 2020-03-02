class IntubationNode < Node
  def process(patient:)
    super

    patient.health += rand(-10..30)

    next_node.process(patient: patient)
  end
end
