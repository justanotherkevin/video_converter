class FfmpegsController < ApplicationController

  def new
    @ffmpeg = Ffmpeg.new
  end
  def create
    @ffmpeg = Ffmpeg.new(ffmpeg_params)
    file = ffmpeg_params[:audio]
    new_file = AudioHero::Sox.new(file.tempfile).convert({output_options: "-c 1 -b 16 -r 16k", output_format: "flac", channel:1})
    @ffmpeg.audio = new_file
    if @ffmpeg.save

      @ffmpeg.transcribe_audio
      flash[:notice] = "Post successfully created"
      render "show"
    else
      flash[:notice] = "Fail to submit"
      redirect_to root_path
    end
  end

  def show

  end

  private
  def ffmpeg_params
   params.require(:ffmpeg).permit(:video, :audio)
  end
end
