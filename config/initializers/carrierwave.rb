CarrierWave.configure do |config|
    config.cache_dir = File.join(Rails.root, 'tmp', 'uploads', Rails.env)
end