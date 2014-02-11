# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Song.destroy_all
Artist.destroy_all

kesha = Artist.create(
  name: "Kesha",
  genre: "House",
  photo_url: "http://goo.gl/QWhCyk"
)

Song.create(
  title: "TiK ToK",
  year: 2012,
  artist: kesha
)

Song.create(
  title: "Your Love is My Drug",
  year: 2012,
  artist: kesha
)


Song.create(
  title: "Die Young",
  year: 2013,
  artist: kesha
)

pitbull = Artist.create(
  name: "Pitbull",
  genre: "Pop",
  photo_url: "http://goo.gl/cHrs67"
)

Song.create(
  title: "I Know You Want Me (Calle Ocho)",
  year: 2009,
  artist: pitbull
)

pitbull_ft_kesha = Artist.create(
  name: "Pitbull ft. Kesha",
  genre: "Pop",
  photo_url: "http://goo.gl/cHrs67"
)

Song.create(
  title: "Timber",
  year: 2013,
  artist_id: pitbull_ft_kesha
)