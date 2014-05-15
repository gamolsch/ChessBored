

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "565234783597821", "1f20e8e9e0422120d91fe69e2fc25749"
end

