class DelayedJobHighJob
  def deliver
    puts "Running inside delayed_job - high queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
  handle_asynchronously :deliver, queue: :high
end
