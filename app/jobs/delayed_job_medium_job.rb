class DelayedJobMediumJob
  def deliver
    puts "Running inside delayed_job - medium queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
  handle_asynchronously :deliver, queue: :medium
end
