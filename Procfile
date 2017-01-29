worker: bundle exec sidekiq -q default -q high -q mailers -C config/sidekiq.yml
web: bundle exec passenger start -p $PORT --max-pool-size 3
