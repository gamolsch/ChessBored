

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "565234783597821", "13d982f54e3513b5e58da05d345c9654"
end

