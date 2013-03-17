require 'pry'
require 'mathn'

def closest_prime(num)
  num += 1
  if num.prime?
   return num
  else
    closest_prime(num)
  end
end


def time_method(method=nil, *args)
  beginning_time = Time.now
  if block_given?
    yield
  else
    self.send(method, args)
  end

  end_time = Time.now
  elapsed = ((end_time - beginning_time) * 1000).round(2)
  puts "Time elapsed #{elapsed} milliseconds"
  return elapsed
end

def generate_random_strings(num)
  strings = []
  alphabet = (65..90)

  num.times do
    string = ""
    5.times do
      string << Random.rand(alphabet).to_s
    end
    strings << string
  end
  strings
end



def generate_ssn(num)
  social_set = Set.new
  loop do
    return social_set.to_a if social_set.size == num
    social_set << Random.rand(111111111...999999999)
  end
end

class HashBrown
  attr_accessor :hash, :data

  def initialize(size: 0)
    @hash = Array.new(size)
    @table_size = @hash.size
  end

  def insert(num, step: 1, increment: 0, durations: 0)
    entry_point = (num % @table_size + (increment ** step)) % @table_size

    if @hash[entry_point].nil?
      durations += 1
      @hash[entry_point] = num
    elsif @hash.compact.size == @table_size
      raise "All slots have been taken"
    else
      durations += 1
      increment += 1

      durations = self.insert(num, step: step, increment: increment, durations: durations)
    end
    # binding.pry
    return durations
  end
end


def benchmark(strings_size: 0, hash_size: 0, increment: 0, step: 1)
  runs = 0
  foo = HashBrown.new(size: closest_prime(2 * hash_size))

  strings = generate_random_strings strings_size

  strings.each do |string|
    runs += foo.insert(string.to_i, increment: increment, step: step)
  end
  puts runs
end


binding.pry