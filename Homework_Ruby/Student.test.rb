require_relative 'student'  
require 'date'

begin 
  student1 = Student.new('Drobytko', 'Mark', Date.new(2000, 5, 15))
  student2 = Student.new('Petrov', 'Petr', Date.new(1995, 10, 25))
  student3 = Student.new('Kovalenko', 'Vlad', Date.new(2006, 6, 4))

  puts "#{student1.surname} #{student1.name} is #{student1.calculate_age} years old."

  students_aged_29 = Student.get_students_by_age(29)
  students_aged_29.each { |s| puts "#{s.surname} #{s.name} is 29 years old." }

  students_named_vlad = Student.get_students_by_name('Vlad')
  students_named_vlad.each { |s| puts "#{s.surname} #{s.name} is named Vlad." }

  Student.remove_student(student1)
  puts "Remaining students after removal:"
  Student.all_students.each { |s| puts "#{s.surname} #{s.name} is in the list." }

rescue ArgumentError => e
  puts e.message
end
