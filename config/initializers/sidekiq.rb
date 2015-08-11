# Be sure to restart your server when you modify this file.

# Configure sidekiq to use the 'draconomicon' namespace in development.
if Rails.env == "development"
  Sidekiq.configure_server do |config|
    config.redis = { url: "redis://localhost:6379", namespace: "draconomicon" }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: "redis://localhost:6379", namespace: "draconomicon" }
  end
end
