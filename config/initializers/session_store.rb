# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ZetoCRM_session',
  :secret      => '494e9a400b214a535ae915ba5ccc1adc87660c17fc4654f1c7310666b2f0756fd1b985789f8aad6b8892e4473c4ea3f55ec749afe71e3955a9ae3a372bf7e084'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
