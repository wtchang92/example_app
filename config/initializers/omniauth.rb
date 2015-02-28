
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '385575684946668', 'dbe5a85035efa61787aa0e734983f7b8'
end