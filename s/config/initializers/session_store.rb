# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_s_session',
  :secret      => 'a52d4b4ed547a9c41f03d77019503c307ebb90f1194c694f13d1f3106bfa88326414338deb3377f167a1acd4a6c5b2f37fa518b9b5214f58681bcaa9c3ae4ab6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
