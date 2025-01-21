class TestJob
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform(seconds)
    ::Rails.logger.info("Sleeping for #{seconds} seconds")
    sleep seconds
    ::Rails.logger.info("Done sleeping for #{seconds} seconds")
  end
end
