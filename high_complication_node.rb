class HighComplicationNode < RandomComplicationNode
  def impact(patient: nil)
    return patient.age + 10 if patient.diabetus

    patient.age - 5
  end
end
