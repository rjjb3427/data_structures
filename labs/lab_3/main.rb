require 'pry'
require 'algorithms'
require 'colorize'

# @day_ticks = 1600
@repair_ticks = 12
@print_ticks = 5

@printer_failure = 0.06
# Chances a job will be added.
@job_percentage = 0.62

# Global for the sake of brevity.
$random_generator = Random.new

class Printer
  @@id = -1
  def initialize(status: :idle)
    @id = @@id += 1
    @status = status
    @busy_ticks = 0
    @breakages = 0
    @completed_jobs = 0
  end
  attr_accessor :status, :id, :busy_ticks, :job

  def pretty_status
    case status
    when :printing
      art =
        "
          |==#{@busy_ticks}==|
        -----------
        | PRINTING|
        |  ~ ~ ~  |
        | | A   | |
        ==|  B  |==
          |   C |
           ~ ~ ~   ".yellow
    when :broken
      art =
        "
          |==#{@busy_ticks}==|
        -----------
        |  BROKEN |
        |  X   X  |
        |   ---   |
        ==~~~~~~~==".red
    when :idle
      art =
        "
          |=====|
        -----------
        |   IDLE  |
        |  Z   Z  |
        |   -~-   |
        ==~~~~~~~==".blue
    end
    "#{art}        |    #{@id}    |".green
  end

  def status_report
    "Printer ##{@id} finished with the status '#{@status}'. The printer completed #{@completed_jobs} job(s) and broke #{@breakages} time(s)."
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

  def spool
    if @busy_ticks == 0
      @status = :idle
      @completed_jobs += 1
    else
      @busy_ticks -= 1
    end
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
    @@id + 1
  end
end

def simulate_printers(num: 5, ticks: 200)
  queue = Containers::PriorityQueue.new

  printers = []
  num.times { |i| printers << Printer.new }

  # It's like real life printers.
  ticks.times do |i|
    # Printer status.
    printers.each do |printer|
      case printer.status
      when :broken
        printer.repair

      when :idle
        if $random_generator.rand <= @printer_failure
          printer.status = :broken
          printer.busy_ticks = @repair_ticks

        else
          job = queue.pop
          unless job.nil?
            printer.job = job
            printer.busy_ticks = @print_ticks
          end
        end

      when :printing
        printer.spool
      end

      puts printer.pretty_status
    end

    # Job creation.
    job_status = ""
    if $random_generator.rand <= @job_percentage
     new_job = Job.new
     queue.push(new_job, new_job.priority)

     job_status = "Job ##{new_job.id} created, priority #{new_job.priority}"
    end

    # Job queuing.
    puts " - Tick #{i}: #{queue.size} job(s) on the queue. #{job_status}".green

    gets.chomp
  end

  # Time to wrap up the stats for the simulation
  printers.each do |printer|
    puts printer.status_report
  end

  puts "#{Job.count} job(s) created. #{queue.size} job(s) left on the queue.".red
end

puts "Welcome to e-printer simulator."
print "How many printers do you desire? "
printer_num = gets.chomp.to_i

print "How many simulation ticks? "
ticks = gets.chomp.to_i

simulate_printers(num: printer_num, ticks: ticks)


