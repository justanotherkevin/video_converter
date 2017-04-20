class FfmpegsController < ApplicationController

  def new
    @ffmpeg = Ffmpeg.new
  end
  def create
    @ffmpeg = Ffmpeg.create(ffmpeg_params)
    if @ffmpeg.save
      flash[:notice] = "Post successfully created"
      render "show"
    else
      flash[:notice] = "Fail to submit"
      binding.pry
      redirect_to root_path
    end
  end

  def show
  end

  private
  def ffmpeg_params
   params.require(:ffmpeg).permit(:video)
  end
end
