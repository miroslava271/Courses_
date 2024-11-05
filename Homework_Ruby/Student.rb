require 'date'

class Student
  @students = []  

  attr_reader :name, :surname, :date_of_birth

  def initialize(surname, name, date_of_birth)
    @surname = surname
    @name = name
    set_date_of_birth(date_of_birth)
    self.class.add_student(self)
  end   

  def set_date_of_birth(date_of_birth)
    if date_of_birth > Date.today
      raise ArgumentError, 'Date of birth must be in the past'
    end
    @date_of_birth = date_of_birth
  end

  def calculate_age
  today = Date.today
  age = today.year - date_of_birth.year
  age -= 1 if today < date_of_birth 
  age
  end

  def ==(other)
    other.is_a?(Student) && name == other.name && surname == other.surname && date_of_birth == other.date_of_birth
  end  

  class << self 
    attr_accessor :students

    def add_student(student)
      students << student unless students.include?(student)
    end

    def remove_student(student)
      students.delete(student)
    end

    def get_students_by_age(age)
      students.select { |student| student.calculate_age == age }
    end

    def get_students_by_name(name)
      students.select { |student| student.name.downcase == name.downcase }
    end

    def all_students
      students
    end
  end
end
