require "orm_adapter"
require "redactor-rails/version"

module RedactorRails
  IMAGE_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/pjpeg', 'image/tiff', 'image/x-png']

  FILE_TYPES = ['application/msword', 'application/pdf', 'text/plain', 'text/rtf', 'application/vnd.ms-excel']

  VIDEO_TYPES = ['video/mpeg', 'video/mp4', 'video/ogg', 'video/quicktime', 'video/webm', 'video/x-ms-wmv', 'video/x-flv']

  AUDIO_TYPES = ['audio/basic', 'audio/mp4', 'audio/mpeg', 'audio/ogg', 'audio/vorbis', 'audio/x-ms-wma', 'audio/x-ms-wax', 'audio/vnd.rn-realaudio', 'audio/vnd.wave', 'audio/webm']

  autoload :Http, 'redactor-rails/http'
  autoload :Devise, 'redactor-rails/devise'

  module Backend
    autoload :CarrierWave, 'redactor-rails/backend/carrierwave'
  end
  require 'redactor-rails/orm/base'
  require 'redactor-rails/orm/active_record'
  require 'redactor-rails/orm/mongoid'
  require 'redactor-rails/engine'
  require 'redactor-rails/helper'

  mattr_accessor :image_file_types, :document_file_types
  @@image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]
  @@document_file_types = ["pdf", "doc", "docx", "xls", "xlsx", "rtf", "txt"]
  @@video_file_types = ["mp4", "avi", "mov", "mpeg"]
  @@audio_file_types = ["wma", "mp3", "ogg", "wav", "aif"]

  def self.picture_model
    RedactorRails::Picture
  end

  def self.document_model
    RedactorRails::Document
  end

  def self.video_model
    RedactorRails::Video
  end

  def self.audio_model
    RedactorRails::Audio
  end

  def self.devise_user
    %s(user)
  end

  def self.devise_user_key
    "#{self.devise_user.to_s}_id".to_sym
  end
end
