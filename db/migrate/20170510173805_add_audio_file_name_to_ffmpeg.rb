class AddAudioFileNameToFfmpeg < ActiveRecord::Migration[5.0]
    def up
        change_table :ffmpegs do |t|
          t.attachment :audio
        end
    end
    def down
      remove_attachment :ffmpegs, :audio
    end
end
