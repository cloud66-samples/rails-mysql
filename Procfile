sidekiq: bundle exec sidekiq -q high -q medium -q low
resque: QUEUE=high,medium,low bundle exec rake resque:work
delayed_job: QUEUES=high,medium,low bundle exec rake jobs:work