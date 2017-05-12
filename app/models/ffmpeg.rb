require "google/cloud/speech"

class Ffmpeg < ApplicationRecord
  def self.get_gcs_credentials
    [:provider, :google_storage_access_key_id, :google_storage_secret_access_key].inject({}){|keys, key| keys[key] = ENV[key.to_s]; keys}
  end
  def self.bucket
    'videotospeechondemoforclient'
  end

  attr_accessor :results

  has_attached_file :video,
  styles: {
    mp4: { format: "mp4",
      convert_options: {
        output: { strict: "experimental",
                  s:      "480x320"
                }
      }
    }
  },
  processors: [:transcoder]

  has_attached_file :audio,
    storage: :fog,
    fog_credentials: self.get_gcs_credentials,
    fog_directory: self.bucket

  validates_attachment_content_type :video,   :content_type => /\Avideo\/.*\Z/
  validates_attachment_content_type :audio,   :content_type => /\Aaudio\/.*\Z/
  # validates_attachment_size :video, :less_than => 5.megabytes


  def self.get_gcs_credentials
    [:provider, :google_storage_access_key_id, :google_storage_secret_access_key].inject({}){|keys, key| keys[key] = ENV[key.to_s]; keys}
  end

  def get_gcs_audio_file_path
    "gs://" + Ffmpeg.bucket + "/" + self.audio.path
  end

  def transcribe_audio
      transcriber = speech_transcriber
      pre_processor = transcriber.audio self.get_gcs_audio_file_path, audio_transcription_params
      operation = pre_processor.process
      operation.wait_until_done!
      self.results = operation.results
      self.transcription = results.map{|r| r.transcript}
      self.save
  end
  def audio_transcription_params
      {encoding:    :flac,
      sample_rate: 16000,
      language:    "en-US"}
  end

  def speech_transcriber
    Google::Cloud::Speech.new project: ENV['project_id']
  end

  def get_transcription

    # file_path = "/public"+self.video.url(:mp4)
    file_path = "gs://videotospeechondemoforclient/another_love.flac"

    project_id = "speech-to-text-163606"
    speech = Google::Cloud::Speech.new project: project_id
    # The audio file's encoding and sample rate
    audio = speech.audio file_path,
      encoding:    :flac,
      sample_rate: 16000,
      language:    "en-US"
    puts "before start"

    operation = audio.process

    puts "Operation started"

    operation.wait_until_done!

    results = operation.results
    p result  = results.first

    puts "Transcription: #{result.transcript}"
  # [END speech_async_recognize_gcs]
  end

end
