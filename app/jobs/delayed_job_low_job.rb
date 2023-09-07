class DelayedJobLowJob
  def deliver
    puts "Running inside delayed_job - low queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
  handle_asynchronously :deliver, queue: :low
end
