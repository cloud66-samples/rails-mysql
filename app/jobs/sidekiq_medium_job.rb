class SidekiqMediumJob
  include Sidekiq::Job
  sidekiq_options queue: "medium"

  def perform
    puts "Running inside Sidekiq - medium queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
end
