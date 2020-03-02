class PatientGenerator
  def self.return_patients(number: )
    patients = []

    number.times do |index| 
      patients << 
        Patient.new(
          name: "Patient #{index}",
          diabetus: [true, false].sample,
          health: rand(40..100),
          age: rand(0..100)
        )
    end

    patients
  end
end
