5 topics on assessment
algorithms
modeling
schema-design
sql
debugging




sherif abushadi god like review
-----------------------------------
recursion vs iteration
# problem: reverse a string using iteration vs recursion

def rev_iter(string)
  new_str = ""
  strings.chars.each do |letter|
    new_str = letter + new_str
  end
end

#test
# str = 'hello'
# p rev_iter(str) == str.reverse

def rev_recu(string, new_str = "") # must have new_str = "" so it "passes in through the door with recursion"
  chars = string.chars
  new_str << chars.pop
  string = chars.join
  return if string.length.zero? # this line will give us the kick out (exiting recursion)
  #need to do something before going into recursion.  
  rev_recu(string, new_str)
end
#test
# str = 'hello'
# p rev_iter(str) == str.reverse


------------------------------------
modules

# modules are used for two things in ruby. 
# 1. namespacing

module A
  module B
    module C
      class X
      end
    end
  end
end

p A::B::C::X.new

# 2. makes methods and classes available when module is called

module A
  def x
    puts "hi from x"
  end
  def y
    puts "hi from y"
  end
end

# extend puts self on each of the methods. 
# module A
#   extend self
# end

# A.x
# A.y

# --------
class M 
  include A
end


#--------
M.new.x
M.new.y


# --------

------------------------------------
mvc
extend self is equivalent to def self.do_something end 


class Model # i hold data. Model holds anything related to data, validation, connection to database. 
  attr_reader :data
  def initialize
    @data = "hello"
  end
end

# class Controller # i make decisions
module Controller
  extend self
  def run
    # view = View.new
    model = Model.new
    View.render(model.data)
  end
end

# class View # i show stuff. Gives display out to the user. 
module View
  extend self
  def render(text)
    puts text
  end
end 

Controller.new.run

------------------------------------
parsing csv
require 'csv'

# p CSV.readlines('data.csv')  #comes in as an array

#
p CSV.readlines('data.csv', #comes in as an hash
                            headers: true, 
                            header_converters: :symbol).map do | row |
                                   row[:school] != "no"
                            end
                            sites.select{|site| site != "no"}.count

#writing to CSV
CSV.open("new_data.csv", 'w+') do |row|
  row<< [ '' , '' , '' ]
end


------------------------------------
to_s 

class A
  def intialize
    @data = "123"
    @lata = "bye"
  end

  def to_s
    "i am a class of type #{self.class} and i hold #{@data}"
  end

  def inspect
    "i am the same class"
  end

end
p A.new
puts A.new

------------------------------------
UPDATE TABLE

Read massive amounts of SQL from articles.



------------------------------------
Nested data structures

Read week 3 under discussions on github.




------------------------------------