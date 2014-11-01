Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, ENV['consumer_key'], ENV['consumer_secret']
  provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
end
