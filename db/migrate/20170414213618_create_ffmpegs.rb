class CreateFfmpegs < ActiveRecord::Migration[5.0]
  def change
    create_table :ffmpegs do |t|

      t.timestamps
    end
  end
end
