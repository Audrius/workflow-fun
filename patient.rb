class Patient

  attr_accessor :name, 
                :health,
                :diabetus,
                :age
                :smoking

  def initialize(name:, health:, diabetus: false, age:, smoking: false)
    @name = name
    @health = health
    @diabetus = diabetus
    @age = age
    @smoking = smoking
  end

  def alive?
    health > 0
  end
end
