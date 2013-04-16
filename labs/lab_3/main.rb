require 'pry'
require 'algorithms'

@printer_num = 5

# Time units
# @print_day = 1600
@day_ticks = 100
@repair_ticks = 12

@printer_failure = 6
# Chances a job will be added.
@job_percentage = 62

# Global for the sake of brevity.
$random_generator = Random.new

class Printer
  @@id = -1
  def initialize(status: :idle)
    @id = @@id += 1
    @status = status
    @busy_ticks = 0
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
    if @busy_ticks == 0
      @status = :idle
      @breakages += 1
    else
      @busy_ticks -= 1
    end
  end

  def job=(job)
    @job = job
    @status = @job.nil? ? :idle : :printing
  end
end

class Job
  @@id = -1
  def initialize(priority: $random_generator.rand(10..100), progress: 0)
    @id = @@id += 1
    @priority = priority
  end
  attr_accessor :id, :priority, :progress

  def self.count
    @@id
  end
end

def simulate_printers
  queue = Containers::PriorityQueue.new

  printers = []
  5.times { |i| printers << Printer.new }

  # It's like real life printers.
  @day_ticks.times do |i|
    # Printer status.
    printers.each do |printer|
      if printer.status == :broken
        printer.repair
      elsif printer.status == :idle && $random_generator.rand(1..100) <= @printer_failure
        printer.status = :broken
        printer.busy_ticks = @repair_ticks
      elsif printer.status == :idle
        printer.job ||= queue.pop
      end

      puts printer.pretty_status
    end

    # Job creation.
    if $random_generator.rand(1..100) <= @job_percentage
     new_job = Job.new
     queue.push(new_job, new_job.priority)

     puts "Job ##{new_job.id} created, priority #{new_job.priority}"
    end

    # Job queuing.
    puts "#{queue.size} job(s) on the queue."
    puts "- Tick #{i}"
        binding.pry
  end

  # Time to wrap up the stats for the simulation
  printers.each do |printer|
    puts printer.status_report
  end

  puts "#{queue.size} job(s) created."
end

simulate_printers

