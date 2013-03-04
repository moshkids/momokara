class CreateTrackData < ActiveRecord::Migration
  def change
    create_table :track_data do |t|
      t.string :title
      t.string :lyric
      t.string :time

      t.timestamps
    end
  end
end
