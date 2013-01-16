# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
if ENV["secret_key_base"]
  if ENV["secret_key_base"].length < 30
    Rails.logger.warn "Please use a secret key base of at least 30 characters"
    if Rails.env.production?
      Rails.logger.error "Not booting the application without a secure secret key base"
      abort
    end
  end
  HamsterEntries::Application.config.secret_key_base = ENV["secret_key_base"]
else
  HamsterEntries::Application.config.secret_key_base = 'a3ecf427da1285c766c30edd0d20dffb21cb11c08c82fa170de6ddbeb3c2d3db8ce779599683897550e8ef7e771d613886a32bbcdf20fc99429fcc9532244754'
  Rails.logger.warn "Using static secret key base. Please ensure that you use a different secret key base in production using the $secret_key_base environment variable"
  if Rails.env.production?
    Rails.logger.error "Not booting the application without a secure secret key base"
    abort
  end
end
