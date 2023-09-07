class SidekiqJob
  include Sidekiq::Job
  sidekiq_options queue: "high"

  def perform
    puts "Running inside Sidekiq!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
end
