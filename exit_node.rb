class ExitNode < Node

  def process(patient:)
    super

    puts "Workflow finished. #{patient.name} H: #{patient.health} - dead?: #{!patient.alive?}"
  end
end