# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach('db/track.csv') do |row|
  TrackDatum.create(:title => row[1], :lyric => row[2], :time => row[3])
end

CSV.foreach('db/playlist.csv') do |row|
  Playlist.create(:title => row[1])
end

CSV.foreach('db/playlistdetail.csv') do |row|
  PlaylistDetail.create(:playlist_id => row[0], :track_no => row[1], :track_data_id => row[2])
end