class DelayedJobJob
  def deliver
    puts "Running inside delayed_job!"
  end
  handle_asynchronously :deliver, queue: :high
end
