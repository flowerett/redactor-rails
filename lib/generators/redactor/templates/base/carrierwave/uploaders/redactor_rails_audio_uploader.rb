# encoding: utf-8
class RedactorRailsAudioUploader < CarrierWave::Uploader::Base
  include RedactorRails::Backend::CarrierWave

  # storage :fog
  storage :file

  def store_dir
    "system/redactor_assets/audios/#{model.id}"
  end

  def extension_white_list
    RedactorRails.audio_file_types
  end
end
