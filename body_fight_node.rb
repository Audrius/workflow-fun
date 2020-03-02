class BodyFightNode < Node
  def process(patient:)
    super

    patient.health -= rand(patient.age / 4)
    patient.health += 20
    next_node.process(patient: patient)
  end
end
