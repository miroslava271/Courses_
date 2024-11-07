require 'minitest/autorun'
require 'minitest/reporters'
require 'date'
require_relative 'student'

Minitest::Reporters.use! Minitest::Reporters::HtmlReporter.new

class StudentTest < Minitest::Test
  def test_initialization
    student = Student.new('Drobytko', 'Mark', Date.new(2000, 5, 15))
    assert_equal 'Drobytko', student.surname
    assert_equal 'Mark', student.name
    assert_equal Date.new(2000, 5, 15), student.date_of_birth
  end
  
  describe '#calculate_age' do
    it 'should calculate age correctly based on date of birth' do
      student = Student.new('Drobytko', 'Mark', Date.new(2000, 5, 15))
      _(student.calculate_age).must_equal Date.today.year - 2000
    end
  end
  
  def test_invalid_date_of_birth
    assert_raises(ArgumentError) { Student.new('Drobytko', 'Mark', Date.today + 1) }
  end
  
  describe 'Equality of students' do
    it 'should be equal if all attributes are equal' do
    student1 = Student.new('Drobytko', 'Mark', Date.new(2000, 5, 15))
    student2 = Student.new('Drobytko', 'Mark', Date.new(2000, 5, 15))
      _(student1).must_equal student2
    end
  end
  
  describe 'Adding students' do
    it 'should add student to the students list' do
    student = Student.new('Drobytko', 'Mark', Date.new(2000, 5, 15))
    _(Student.students).must_include student
    end
  end
  
  def test_get_students_by_age
    student1 = Student.new('Drobytko', 'Mark', Date.new(2000, 5, 15))
    student2 = Student.new('Petrov', 'Petr', Date.new(1995, 10, 25))
    assert_includes Student.get_students_by_age(29), student1
    refute_includes Student.get_students_by_age(29), student2
  end
  
  def test_get_students_by_name
    student1 = Student.new('Drobytko', 'Mark', Date.new(2000, 5, 15))
    student2 = Student.new('Petrov', 'Petr', Date.new(1995, 10, 25))
    assert_includes Student.get_students_by_name('Mark'), student1
    refute_includes Student.get_students_by_name('Mark'), student2
  end

  def test_remove_sudent
    student = Student.new('Drobytko', 'Mark', Date.new(2000, 5, 15))
    Student.remove_student(student)
    refute_includes Student.students, student
      end
  end
