class Teacher < Person
  attr_accessor :specialisation

  def initialize(specialisation, age, name = 'Unknown')
    super(age, name)
    @specialisation = specialisation
  end

  def can_use_services?
    true
  end
end
