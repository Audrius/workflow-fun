class InsulineNode < Node
  def process(patient:)
    super

    patient.health += rand(0..10) if patient.diabetus
    next_node.process(patient: patient)
  end
end