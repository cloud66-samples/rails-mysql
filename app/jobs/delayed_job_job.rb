class DelayedJobJob
  def deliver
    puts "Running inside delayed_job!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
  handle_asynchronously :deliver, queue: :high
end
