class LowHealthNode < Node
  def process(patient:)
    super

    if patient.health < 15
      puts "!!! Health low #{patient.health}" 
      left_node.process(patient: patient)
    else
      puts "Health good #{patient.health}" 
      right_node.process(patient: patient)
    end
  end
end
