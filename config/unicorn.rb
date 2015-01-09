worker_processes (ENV["UNICORN_WORKERS"] || 3).to_i
timeout (ENV["UNICORN_TIMEOUT"] || 15).to_i
preload_app true

before_fork do |_server, _worker|
  Signal.trap "TERM" do
    Rails.logger.info "Unicorn master intercepting TERM, sending myself QUIT instead"
    Process.kill "QUIT", Process.pid
  end

  defined?(ActiveRecord::Base) && ActiveRecord::Base.connection.disconnect!
end

after_fork do |_server, _worker|
  Signal.trap "TERM" do
    Rails.logger.info "Unicorn worker intercepting TERM, waiting for master to send QUIT"
  end

  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end
