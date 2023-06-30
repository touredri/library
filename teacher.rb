class Teacher < Person
  attr_accessor :specialisation
  #, :id

  def initialize(specialisation, age, name = 'Unknown')
    super(age, name)
    @specialisation = specialisation
    #@id = nil
  end

  def can_use_services?
    true
  end

  def serialize
    {
      'type' => 'teacher',
      'id' => id,
      'name' => name,
      'age' => age,
      #'rentals' => rentals.map(&:serialize),
      'specialisation' => specialisation
    }
  end
end
