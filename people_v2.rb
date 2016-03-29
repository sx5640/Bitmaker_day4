#something interesting found along the way, and it worked.
#this time I defined the classes under the module People which initializes everything for the classes, and it worked!
#noticed I can create a Student object via People::Student, or People::Student::Student, or People::Student::Student::Student. it will however always return "People::Student:0x00564f976d9498 @name='xiu'.
#if I call People::Student::Student, it worked, but also give me this:
#(irb):7: warning: toplevel constant People referenced by People::Student::People
=> #<People::Student:0x00564f976e8ec0 @name="xiu">"



module People
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{name}"
  end

  class Student
    include People
    def learn
      puts "I get it!"
    end

  end

  class Instructor
    include People
    def teach
      puts "Everything in Ruby is an Object"
    end

  end

end
# chris = Instructor.new("Chris")
# chris.greeting
#
# cristina = Student.new("Cristina")
# cristina.greeting
#
# chris.teach
# cristina.learn
