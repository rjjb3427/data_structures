# Lab 1: Radix sort
# Eric Wright (000677983)

require 'pry'
require 'colorize'
require 'set'

def radixSort(data)
  # passes = Array.new
  steps = 0

  3.times do |t|
    # Allocate 1000 slots.
    bucket = Array.new(1000)

    data.each do |num|

      octet = if t == 0
                num % 1000
              elsif t == 1
                (num % 1000000) / 1000
              else
                num / 1000000
              end
      steps += 1

      case bucket[octet]
      when nil
        bucket[octet] = num
        steps += 1
      when Fixnum
        old_num = bucket[octet]
        bucket[octet] = num >= old_num ? [old_num, num] : [num, old_num]
        steps += 3
      when Array
        if bucket[octet].first >= num
          bucket[octet][-1...-1] = num # => Insert num before last number.
        else
          bucket[octet] << num
        end
        steps += 2
      end
    end
    # Compact bucket (remove nil entries), flatten inner arrays.
    data = bucket.compact.flatten
    steps += 2
    # passes << data
    steps += 1
  end

  # table = passes.transpose
  # table.each do |row|
  #   first_pass  = row[0].to_s[0...6] + row[0].to_s[6...9].red
  #   second_pass = row[1].to_s[0...3] + row[1].to_s[3...6].red + row[1].to_s[6...9].green
  #   third_pass  = row[2].to_s[0...3].red + row[2].to_s[3...6].green + row[2].to_s[6...9].green

  #   puts "#{first_pass}\t #{second_pass}\t #{third_pass}\t"
  # end

  auto_sorted = data.sort
  puts "UNSORTED!" unless auto_sorted.eql?(data)
  return steps
end


def legacyRadixSort(data)
  bucket = []

  data.each do |num|
    bucket[num] = bucket[num].nil? ? 1 : (bucket[num] += 1)
  end

  bucket.each_with_index do |num, i|
    unless num.nil?
      num.times { puts i }
    end
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

def generate_ssn(num)
  social_set = Set.new
  loop do
    return social_set.to_a if social_set.size == num
    social_set << Random.rand(111111111...999999999)
  end
end

benchmarks = Array.new

20.times do |n|
  benchmarks[n] = Array.new
  socials = generate_ssn(2 ** n)

  benchmarks[n] << time_method do
    benchmarks[n] << socials.size
    benchmarks[n] << radixSort(socials)
  end
end

benchmarks.each { |row| puts "#{row[0]},#{row[1]},#{row[2]}" }

