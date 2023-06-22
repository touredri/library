require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'student'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name

terminal = Classroom.new("class1")
std1 = Student.new(22, "elv1")
terminal.add_student(std1)
puts std1.classroom.label
