PARSING DATA

require 'csv'

class Person

  attr_reader :id, :first_name, :last_name, :email, :phone, :created_at

  def initialize(args)
    @id = args[:id]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @email = args[:email]
    @phone = args[:phone]
    @created_at = args[:created_at]
  end

end

class PersonParser
  attr_reader :file

  def initialize(file)
    @file = file
    @people = []
  end

  def people
    CSV.read(file, headers: true, header_converters: :symbol).map do |row|
      @people << Person.new(row)
    end
    return @people
  end

  def add_person(new_person)
    @people << Person.new(new_person)
    return @people
  end

  def save(file)
    CSV.open(file, "w", :headers=> true, :headers => ["id","first_name","last_name","email","phone","created_at"]) do |csv|
        @people.each do |person|
        csv << [person.id, person.first_name, person.last_name, person.email, person.phone, person.created_at]
        end
      end
    end
end

p parser = PersonParser.new('people.csv')

parser.people
parser.add_person(id: "201", first_name: "Mike", last_name: "Horn", email: "mhorn918@gmail.com", phone: "1-702-580-4744", created_at: Time.now)
 parser.add_person(id: "202", first_name: "Alex", last_name: "Tarkowski", email: "alex.tarkowksi@gmail.com", phone: "416-111-2222", created_at: Time.now)


OO STUFF

class NoOrangesError < StandardError
end

class OrangeTree
  attr_accessor :age

  def initialize
    @age = 0
    @height = 0
    @dead = false
    @bushell = []
  end

  def tree_age
    p "The tree is #{@age} year(s) old"
  end

  def age!
    @age += 1
    create_oranges
    grow_tree
    kill_if_old
    age_oranges
    self
  end

  def grow_tree
    @height = age * 5
  end


  def any_oranges?
    return true if count_oranges > 0
  end

  def count_oranges
    @bushell.length
  end

  def create_oranges
    rand(5..10).times do
    @bushell << Orange.new(rand(1..5))
    end
  end

  def age_oranges
    @bushell.each do |orange|
      orange.age!
    end
  end

  def how_many_oranges
    p "The tree has #{@count_oranges} ripe GMO Oranges!"
  end

  def remove_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?
    return @bushell.shift

  end

  def kill_if_old
    if @age >= 10
      @dead = true
      @height = nil
      p "This tree is now plywood"
    else
      @dead = false
    end
  end

  def avg_diameter
    @bushell.inject do |sum, orange|
      average_diameter = (sum + orange.grow)/@bushell.length
    end
    average_diameter
  end

def to_s
  puts "This tree is #{@age} year(s) old"
  puts "It is #{@height} miles tall"
  puts "It has #{count_oranges} number of oranges that are an average of #{avg_diameter} feet wide"

end

end

class Orange
  attr_reader :diameter
  attr_writer :age
  def initialize(diameter)
    @diameter = diameter
    @age = 0
  end

  def grow
    @diameter = @age * @diameter
    @diameter
  end

  def age!
    @age += 1
    grow
  end


end

class Basket
  attr_writer :basket
def initialize
  @basket = []
end

def count_basket
  p @basket.length
end

def get_orange_from!(tree)
  @basket << tree.remove_an_orange!
end

end


ENUMERABLE STUFF

class Array
  def my_each
    self.length.times do |i|
      yield(self[i])
    end
  end

  def my_select
    # binding.pry
    var = []
    self.length.times do |i|
      if yield(self[i]) == true
        var << self[i]
      end
    end
    var
  end
# select selects all elements that evaluate as true in array
# reject selects all elements that are false in the evaluation

  def my_reject
    var = []
    self.length.times do |i|
      if yield(self[i]) == false
        var << self[i]
      end
    end
    var
  end

  def my_find
    var = 0
    self.length.times do |i|
      if yield(self[i]) == true
        var = self[i]
      end
    end
    var
  end

  def my_map
    var = []
    self.length.times do |i|
    var << yield(self[i])
    end
    var
  end

  def my_reduce(num)
    var = num
    self.length.times do |i|
      var += yield(num,self[i])
    end
    p var
  end
end



def odd_indexed_integers(array)

  new_array = []
 p array.each_with_index{|x,i| new_array << array[i] if i.odd? }
 p new_array
end


# TODO: Return the odd numbers from a list of integers.
#       You should make use of Enumerable#select
def odd_integers(array)
  array.select{ |num| num.odd? }
end

# TODO: Return the first number from an Array that is less than a particular number - 'limit.'
#       You should make use of Enumerable#find
def first_under(array, limit)
  array.find{ |num| num < limit }
end

# TODO: Take an Array of Strings and return a new Array with an exclamation point appended to each String.
#       You should make use of Enumerable#map
def add_bang(array)
  array.map{|word| word + "!"}
end

# TODO: Calculate the sum of an Array of numbers.
#       You should make use of Enumerable#reduce
def sum(array)
  array.reduce(:+)
end

# TODO: Reorganize an Array of the elements into groups of 3, and then sort each group alphabetically.
#       You should make use of Enumerable#each_slice
def sorted_triples(array)
 new_array=[]
 array.each_slice(3){|a| new_array << a.sort}
 new_array


 REGEX STUFF

 # Determine whether a string contains a Social Security number.
def has_ssn?(string)
  string.match('\d\d\d-\d\d-\d\d\d\d') ? true : false
end

# Return the Social Security number from a string.
def grab_ssn(string)
  has_ssn?(string) ? string.match('\d\d\d-\d\d-\d\d\d\d').to_s : nil
end

# Return all of the Social Security numbers from a string.
def grab_all_ssns(string)
 string.scan(/\d\d\d-\d\d-\d\d\d\d/)
end


# Obfuscate all of the Social Security numbers in a string. Example: XXX-XX-4430.
def hide_all_ssns(string)
  string.gsub(/\d\d\d-\d\d/,'XXX-XX')
end
# Ensure all of the Social Security numbers use dashes for delimiters.
# Example: 480.01.4430 and 480014430 would both be 480-01-4430.
def format_ssns(string)
 # joined = string.scan(/\d/).join
 # joined.scan(/\d\d\d\d\d\d\d\d\d/)
 # to_s. gsub(pattern, )
end

RECURSION & ITERATION

def fibonacci_iterative(n)
  seq1=0
  seq2=1
  seq3=1
  1.upto(n) { |fib| seq1=seq2
                    seq2=seq3
                    seq3=seq1+seq2 }
  seq1
end
fibonacci_iterative(6)

def fibonacci_recursive(n)
  return n if n < 2
  fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
end
fibonacci_recursive(6)

PRIMES

def prime_numbers(number)
  primes = []
  Prime.each(number) do |prime|
    while number % prime == 0
    primes << prime
    number = number / prime
    end
  end
  p primes
end

prime_numbers(10p)

LINEAR SEARCHING

def linear_search(obj, array)
  i = 0
  while i < array.length
    return i if array[i] == obj
    i += 1
  end
  nil
end

def global_linear_search(obj, array)
  indices = []
  i = 0
  while i < array.length
    indices << i if array[i] == obj
    i += 1
  end
  indices.length > 0 ? indices : nil
end
