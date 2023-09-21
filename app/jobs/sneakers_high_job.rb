class SneakersHighJob
  include Sneakers::Worker
  from_queue "high"

  def work(msg)
    puts "Running inside sneakers - high queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
    ack!
  end
end
