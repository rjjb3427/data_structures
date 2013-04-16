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
    @breakages = 0
  end
  attr_accessor :status, :id, :repair_time, :job

  def pretty_status
    health = status == :broken ? ": #{@repair_time} ticks left." : ""
    "Printer #{@id} is #{@status}#{health}"
  end

  def status_report
    "Printer #{@id} finished #{@status}. The printer broke #{@breakages} time(s)."
  end

  def repair
    if @repair_time == 0
      @status = :idle
      @breakages += 1
    else
      @repair_time -= 1
    end
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

  # It's like real life printers.
  @day_ticks.times do |i|
    printers.each do |printer|
      if printer.status == :broken
        printer.repair
      elsif printer.status != :printing && @random_generator.rand(1..100) <= @printer_failure
        printer.status = :broken
        printer.repair_time = @repair_ticks
      end

      puts printer.pretty_status
    end

    if @random_generator.rand(1..100) <= @job_percentage
     puts "Job added"
    end
    puts "- Tick #{i}"
        # binding.pry
  end

  # Time to wrap up the stats for the simulation
  printers.each do |printer|
    puts printer.status_report
  end
end

simulate_printers

