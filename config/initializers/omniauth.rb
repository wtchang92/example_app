
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '385589738278596', '0e7ca97461c9b1a82e6fb75cb1a42296'
         
end