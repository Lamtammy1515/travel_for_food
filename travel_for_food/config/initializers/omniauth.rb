Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "666b4c389c8073da8099", "1a9f9bb016ff870b9eaf4715526d5d0400567963"
end
