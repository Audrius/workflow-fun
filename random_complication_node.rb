class RandomComplicationNode < Node
  def process(patient:)
    super

    patient.health -= rand(impact(patient: patient))
    next_node.process(patient: patient)
  end

  def impact(patient: nil)
    fail "Not implemented"
  end
end
