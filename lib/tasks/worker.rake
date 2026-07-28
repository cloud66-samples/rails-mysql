namespace :test do
  # Long-running process used by the Procfile worker/scheduler entries to show
  # that Cloud 66 keeps non-web processes alive.
  task work: :environment do
    loop do
      puts "I'm working (running as \"#{`whoami`.strip}\")"
      sleep(5)
    end
  end

  # One-shot equivalent of `test:work`, for verifying scheduled/one-off jobs.
  task job: :environment do
    puts "I'm doing this job (running as \"#{`whoami`.strip}\")"
    sleep(5)
  end
end
