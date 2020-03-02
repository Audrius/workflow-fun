class VitamineNode < Node
  def process(patient:)
    super

    patient.health += rand(0..5)
    next_node.process(patient: patient)
  end
end