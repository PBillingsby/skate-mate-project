Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["697688629201-44s2eiesfem8qp13elra463rrciv6p1a"], ENV["WWRiHnvUuDjgIy374I1e8Hyz"],  :skip_jwt => true
end