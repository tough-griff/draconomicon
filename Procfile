web: bundle exec passenger start -p $PORT --max-pool-size $MAX_POOL_SIZE
worker: bundle exec sidekiq -q priority -q default -q mailers
