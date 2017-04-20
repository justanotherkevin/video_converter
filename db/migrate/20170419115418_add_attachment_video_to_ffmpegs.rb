class AddAttachmentVideoToFfmpegs < ActiveRecord::Migration[5.0]
    def self.up
      change_table :ffmpegs do |t|
        t.attachment :video
      end
    end
    def self.down
      remove_attachment :ffmpegs, :video
    end

end
