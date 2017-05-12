class VideosController < ApplicationController
  def index
  end
  def new
    @ffmpeg = Ffmpeg.new
  end
  def create
    binding.pry
    render 'videos#index'
  end

  private
  def ffmpeg_params
    params.require(:ffmpeg).permit(:video)
  end
end
