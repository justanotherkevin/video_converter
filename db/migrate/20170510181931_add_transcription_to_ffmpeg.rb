class AddTranscriptionToFfmpeg < ActiveRecord::Migration[5.0]
  def change
      add_column :ffmpegs, :transcription, :text
  end
end
