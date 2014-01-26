# encoding: utf-8
class RedactorRailsVideoUploader < CarrierWave::Uploader::Base
  include RedactorRails::Backend::CarrierWave

  # storage :fog
  storage :file

  def store_dir
    "system/redactor_assets/videos/#{model.id}"
  end

  def extension_white_list
    RedactorRails.video_file_types
  end
end
