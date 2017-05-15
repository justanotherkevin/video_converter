module FfmpegsHelper
    def ffmpeg_and_sox(object)
        ffmpeg_object = Ffmpeg.new(object)
        aduio_rip = object[:audio]
        new_file = AudioHero::Sox.new(aduio_rip.tempfile).convert({output_options: "-c 1 -b 16 -r 16k", output_format: "flac", channel:1})
        @ffmpeg.audio = new_file

    end
end
