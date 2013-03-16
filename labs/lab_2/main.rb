require 'pry'
require 'mathn'

def closest_prime(num)
  begin
    num =+ 1
  end while num.prime?
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

def generate_ssn(num)
  social_set = Set.new
  loop do
    return social_set.to_a if social_set.size == num
    social_set << Random.rand(111111111...999999999)
  end
end

binding.pry