class RedactorRails::AudiosController < ApplicationController
  before_filter :redactor_authenticate_user!

  def index
    @audios = RedactorRails.audio_model.where(
      RedactorRails.audio_model.new.respond_to?(RedactorRails.devise_user) ? { RedactorRails.devise_user_key => redactor_current_user.id } : { }
    )
    render :json => @audios.to_json
  end

  def create
    @audio = RedactorRails.audio_model.new

    file = params[:file]
    @audio.data = RedactorRails::Http.normalize_param(file, request)
    if @audio.respond_to?(RedactorRails.devise_user)
      @audio.send("#{RedactorRails.devise_user}=", redactor_current_user)
      @audio.assetable = redactor_current_user
    end

    if @audio.save
      render :text => { :filelink => @audio.url, :filename => @audio.filename }.to_json
    else
      render :nothing => true
    end
  end

  private

  def redactor_authenticate_user!
    if RedactorRails.audio_model.new.respond_to?(RedactorRails.devise_user)
      super
    end
  end
end
