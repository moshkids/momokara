class CreatePlaylistDetails < ActiveRecord::Migration
  def change
    create_table :playlist_details do |t|
      t.integer :track_no
      t.integer :track_data_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
