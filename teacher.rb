class Teacher < Person
  def initialize(specialisation)
    super()
    @specialisation = specialisation
  end

  def can_use_services?
    true
  end
end
