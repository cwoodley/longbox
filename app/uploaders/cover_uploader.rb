# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base
include Sprockets::Helpers::RailsHelper
include Sprockets::Helpers::IsolatedHelper

  include CarrierWave::RMagick
  include CarrierWave::Processing::RMagick
  
  if Rails.env.development?
    storage :file
  else 
    storage :fog
  end

  include CarrierWave::MimeTypes
  process :set_content_type

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  asset_path("default.png")
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_limit => [100, 100]
    process :optimize
  end

  version :medium do
    process :resize_to_limit => [300, 300]
    process :optimize
  end

  version :large do
    process :resize_to_limit => [600, 600]
    process :optimize
  end

  # Cache dir for deploying to Heroku
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def optimize
  manipulate! do |img, index, options|
    options[:write] = {
      :quality => 90, # Change the quality to 90%
      :depth => 8, # Set the depth to 8 bits
      :interlace => "Magick::PlaneInterlace" # Add progressive support for JPEG
    }
    img.strip! # Remove profile data
  end
end

  # def filename
  #   super.chomp(File.extname(super)) + '.jpg'
  # end
end