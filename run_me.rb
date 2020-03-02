require './node.rb'
require './entry_node.rb'
require './exit_node.rb'
require './insuline_node.rb'
require './vitamine_node.rb'
require './patient.rb'
require './random_complication_node.rb'
require './low_complication_node.rb'
require './medium_complication_node.rb'
require './high_complication_node.rb'
require './body_fight_node.rb'
require './low_health_check_node.rb'
require './intubation_node.rb'

require './patient_generator.rb'
require './workflow.rb'

require 'pry'

entry_node = EntryNode.new
low_complication_node = LowComplicationNode.new
medium_complication_node = MediumComplicationNode.new
high_complication_node = HighComplicationNode.new

vitamin_node = VitamineNode.new
insuline_node = InsulineNode.new

body_fight_node = BodyFightNode.new
low_health_node = LowHealthCheckNode.new
intubation_node = IntubationNode.new

exit_node = ExitNode.new

nodes = [
  entry_node,
  low_complication_node,
  medium_complication_node,
  high_complication_node,
  vitamin_node,
  insuline_node,
  body_fight_node,
  low_health_node,
  intubation_node,
  exit_node
]

workflow = Workflow.new(name: "Wuhan Medical Procedures", nodes: nodes)

workflow.add_edge(entry_node, low_complication_node)
workflow.add_edge(low_complication_node, vitamin_node)
workflow.add_edge(vitamin_node, medium_complication_node)
workflow.add_edge(medium_complication_node, insuline_node)
workflow.add_edge(insuline_node, high_complication_node)
workflow.add_edge(high_complication_node, low_health_node)

workflow.add_edge(low_health_node, intubation_node)
workflow.add_edge(low_health_node, body_fight_node)
workflow.add_edge(intubation_node, body_fight_node)

workflow.add_edge(body_fight_node, exit_node)

patients = PatientGenerator.return_patients(number: 80_000)

patients.each do |patient|
  workflow.process_patient(patient: patient)
end

puts

puts "#{workflow.name} !! Results ---  "\
     "Alive Patients: #{patients.select{|p| p.alive?}.count } "\
     "Dead Patients: #{patients.select{|p| !p.alive?}.count } "\
     "Dead Ratio:  #{(patients.select{|p| !p.alive?}.count / patients.count.to_f * 100).round(2) } "
