class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, uniqueness: true
  validates :title, :overview, presence: true

  def self.search(query)
    require 'json'
    require 'open-uri'

    url = ENV['TMBB_BASE_API'] + query.to_s
    movies_serialized = URI.open(url).read
    movies = JSON.parse(movies_serialized)
    movies['results'].each do |m|
      Movie.create(
        title: m['title'],
        overview: m['overview'],
        poster_url: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2#{m['poster_path']}",
        rating: m['vote_average'],
        popularity: m['popularity']
      )
    end
  end
end
