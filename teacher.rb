class Teacher < Person
  attr_accessor :specialisation

  def initialize(specialisation, age)
    super(age, 'Unknown')
    @specialisation = specialisation
  end

  def can_use_services?
    true
  end
end
