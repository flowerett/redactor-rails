class RedactorRails::VideosController < ApplicationController
  before_filter :redactor_authenticate_user!

  def index
    @videos = RedactorRails.video_model.where(
      RedactorRails.video_model.new.respond_to?(RedactorRails.devise_user) ? { RedactorRails.devise_user_key => redactor_current_user.id } : { }
    )
    render :json => @videos.to_json
  end

  def create
    @video = RedactorRails.video_model.new

    file = params[:file]
    @video.data = RedactorRails::Http.normalize_param(file, request)
    if @video.respond_to?(RedactorRails.devise_user)
      @video.send("#{RedactorRails.devise_user}=", redactor_current_user)
      @video.assetable = redactor_current_user
    end

    if @video.save
      render :text => { :filelink => @video.url, :filename => @video.filename }.to_json
    else
      render :nothing => true
    end
  end

  private

  def redactor_authenticate_user!
    if RedactorRails.video_model.new.respond_to?(RedactorRails.devise_user)
      super
    end
  end
end
