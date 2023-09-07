class SidekiqLowJob
  include Sidekiq::Job
  sidekiq_options queue: "low"

  def perform
    puts "Running inside Sidekiq - low queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
end
