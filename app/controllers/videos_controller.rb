class VideosController < ApplicationController
  def index
  end
  def new
  end
  def create
    render 'videos#index'
  end

  private
  def ffmpeg_params
    params.require(:ffmpeg).permit(:video, :conversion_option)
  end
end
