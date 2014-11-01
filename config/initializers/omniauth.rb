Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '2023634a6aee48178e73fe7c6fcb56c0', '332af266f95641f1a7c4828b68865075'
end



##  This is how the middleware config file SHOULD look like without being 'hard-coded'
#
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :fitbit, 'consumer_key', 'consumer_secret'
# end



##  These are the origial Key and Secret provided to me by Eric Fransen
# fitbit:
# Client (Consumer) Key
# 2023634a6aee48178e73fe7c6fcb56c0
# Client (Consumer) Secret
# 332af266f95641f1a7c4828b68865075
