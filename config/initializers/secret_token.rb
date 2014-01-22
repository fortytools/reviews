# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
PeerReview::Application.config.secret_key_base = ENV['RAILS_SECRE_TKEY'] || 'db1d1f0b6d8d50d64a6e0dc9c9e512be154c7dfed9d4a27d6a155ae99fd5d29d99fdfd0bf2b76ecaa74ee26a56f6a729f5984b5cb67c82028ca7ab128e7a41f6'
