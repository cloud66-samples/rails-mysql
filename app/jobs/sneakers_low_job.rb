class SneakersLowJob
  include Sneakers::Worker
  from_queue "low"

  def work(msg)
    puts "Running inside sneakers - low queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
    ack!
  end
end
