class FfmpegsController < ApplicationController

  def create
    binding.pry
    ffmpeg_params
    movie = FFMPEG::Movie.new(ffmpeg_params[:video].path)
    if movie
      puts "movie made"
      @new_movie = movie.transcode("movie2.mp4")
    end
    # trusting that it will always create successful
    render "show"
  end

  def show
  end

  private
  def ffmpeg_params
   params.require(:ffmpeg).permit(:video, :conversion_option)
  end
end
