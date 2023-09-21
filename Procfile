sidekiq: bundle exec sidekiq -q high -q medium -q low -c 3
resque: COUNT=3 QUEUE=high,medium,low bundle exec rake resque:workers
delayed_job: QUEUES=high,medium,low bundle exec rake jobs:work # start 3 times
sneakers: bundle exec sneakers work SneakersHighJob,SneakersMediumJob,SneakersLowJob --require config/sneakers_boot.rb