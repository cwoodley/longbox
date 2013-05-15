# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include CarrierWave::Processing::RMagick

  #storage :file
  storage :fog
  include CarrierWave::MimeTypes
  process :set_content_type

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_limit => [100, 100]
    process :quality => 70
  end

  version :medium do
    process :resize_to_limit => [300, 300]
    process :quality => 90
  end

  version :large do
    process :resize_to_limit => [600, 600]
    process :quality => 90
  end

  # Cache dir for deploying to Heroku
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
end
