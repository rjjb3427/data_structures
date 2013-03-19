require 'pry'
require 'mathn'

def closest_prime(num, increment: 1)
  num += increment
  if num.prime?
   return num
  elsif num <= 1
    raise "Cannot find prime numbers less than 2"
  else
    closest_prime(num, increment: increment)
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


class HashBrown
  attr_accessor :hash, :data

  def initialize(size: 0)
    @hash = Array.new(size)
    @table_size = @hash.size
  end

  def insert(num, step: 1, increment: 0, durations: 0, type: :single)
    if type == :single
      entry_point = (num % @table_size + (increment ** step)) % @table_size
    elsif type == :double
      r = closest_prime(@table_size, increment: -1)
      entry_point = (num % @table_size + (increment * (r - num % r))) % @table_size
    end

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


def benchmark(strings_size: 0, hash_size: 0, increment: 0, step: 1, type: :single)
  runs = 0
  foo = HashBrown.new(size: closest_prime(2 * hash_size))

  strings = generate_random_strings strings_size

  strings.each do |string|
    runs += foo.insert(string.to_i, increment: increment, step: step)
  end
  puts runs
end


binding.pry