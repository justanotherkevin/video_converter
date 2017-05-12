CarrierWave.configure do |config|
  # config.fog_provider = 'fog/google'                        # required
  config.fog_credentials = {
    provider:                         'Google',
    google_storage_access_key_id:     'GOOG2ZECDH3C22TQHUEE',
    google_storage_secret_access_key: 'e6iphevn+2YJ5arTWovl0hd1Tx6vAvjoDjLyrWwz	'
  }
  config.fog_directory = 'videotospeechondemoforclient'
end
