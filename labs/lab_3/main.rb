require 'pry'


@printer_num = 5

# Time units
# @print_day = 1600
@day_ticks = 100
@repair_ticks = 12

@printer_failure = 6
# Chances a job will be added.
@job_percentage = 62
@random_generator = Random.new

class Printer
  @@id = -1
  def initialize(status: :idle)
    @id = @@id += 1
    @status = status
    @repair_time = 0
  end
  attr_accessor :status, :id, :repair_time, :job

  def pretty_status
    health = status == :broken ? ": #{@repair_time} ticks left." : ""
    "Printer #{@id} is #{@status}#{health}"
  end
end

class Job
  @@id = -1
  def initialize(priority: 0, progress: 0)
    @id = @@id += 1
    @priority = priority
  end
  attr_accessor :id, :priority, :progress
end

def simulate_printers
  printers = []
  5.times { |i| printers << Printer.new }

  @day_ticks.times do |i|
    printers.each do |printer|
      if printer.status == :broken
        printer.repair_time == 0 ? printer.status = :idle : printer.repair_time -= 1

      elsif printer.status != :printing && @random_generator.rand(1..100) <= @printer_failure
        printer.status = :broken
        printer.repair_time = @repair_ticks
      end

      puts printer.pretty_status
    end

    if @random_generator.rand(1..100) <= @job_percentage
     puts "Job added"
    end
    puts "- Tick #{id}"
        binding.pry
  end
end

simulate_printers

