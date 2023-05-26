# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#require 'uri'
require 'net/http'
require 'openssl'
require 'json'
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Movie.destroy_all

url = URI.open("http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>").read
movies = JSON.parse(url)
movies["results"].take(20).each do |movie|
  new_movie = Movie.new(
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  )
  new_movie.save!
end
