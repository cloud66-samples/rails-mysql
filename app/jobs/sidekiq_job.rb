class SidekiqJob
  include Sidekiq::Job
  sidekiq_options queue: "high"

  def perform
    puts "Running inside Sidekiq!"
  end
end
