class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def serialize
    {
      'type' => 'student',
      'id' => id,
      'name' => name,
      'age' => age,
      # 'rentals' => rentals.map(&:serialize),
      'parent_permission' => parent_permission
    }
  end
end
