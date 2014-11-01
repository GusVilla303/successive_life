Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '2023634a6aee48178e73fe7c6fcb56c0', '332af266f95641f1a7c4828b68865075'
  provider :twitter, ENV['twitter_key'], ENV['twitter_password']

end



##  This is how the middleware config file SHOULD look like without being 'hard-coded'
#
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :fitbit, ENV['fitbit_key'], ENV['fitbit_secret']
# end



##  These are the origial Key and Secret provided to me by Eric Fransen
# fitbit:
# Client (Consumer) Key
# 2023634a6aee48178e73fe7c6fcb56c0
# Client (Consumer) Secret
# 332af266f95641f1a7c4828b68865075
