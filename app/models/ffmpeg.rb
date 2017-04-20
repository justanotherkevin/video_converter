class Ffmpeg < ApplicationRecord
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

  validates :video, presence: true
  validates_attachment_content_type :video,   :content_type => /\Avideo\/.*\Z/
  validates_attachment_size :video, :less_than => 5.megabytes
end
