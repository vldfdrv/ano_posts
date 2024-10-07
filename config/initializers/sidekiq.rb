require 'sidekiq/web'

sidekiq_config = { url: "redis://localhost:6379" }

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end