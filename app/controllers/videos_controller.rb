class VideosController < ApplicationController
  def index
    # debugger
    # @options_format = ["AVI", "ASF", "MOV", "AVCHD", "FLV","MPG","MP4","WMV"]
  end
  def new
    @ffmpeg = Ffmpeg.new
    @options_format = ["AVI", "ASF", "MOV", "AVCHD", "FLV","MPG","MP4","WMV"]
    @options_resolution = ["720×480","640×480", "512×384", "480×320", "320×240", "1920x1080", "1280x720", "854×480", "768×432", "640×360", "512×288", "320×180"]
    
  end
  def create
    debugger
    render 'videos#index'
  end

  private
  def ffmpeg_params
    params.require(:ffmpeg).permit(:video, :conversion_option)
  end
end
