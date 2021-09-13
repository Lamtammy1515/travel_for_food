Rails.application.config.middleware.use OmniAuth::Builder do
<<<<<<< HEAD
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  end
=======
  provider :github, ENV["GITHUB_KEY"], ENV["GITHUB_SECRET"]
end
>>>>>>> cf66098562db38baa90e411c13a42298b12adde5
