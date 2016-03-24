#something interesting found along the way, and it worked.
#I put initialize and attr both in a module and called it in each class.

module People
  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

module Human_behave
  def greeting
    puts "Hi, my name is #{name}"
  end
end

# class People
#   include Human_behave
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
# end

class Student #< People
  include People
  include Human_behave
  def learn
    puts "I get it!"
  end

end

class Instructor #< People
  include People
  include Human_behave
  def teach
    puts "Everything in Ruby is an Object"
  end

end

chris = Instructor.new("Chris")
puts chris
chris.greeting

cristina = Student.new("Cristina")
puts cristina
cristina.greeting

chris.teach
cristina.learn

#chris.learn       #the learn method is undifined for Instructor
