class Prompt < ApplicationRecord
  include API
  has_many :posts

  def self.movie_prompt(title)
    @movies = []
    response1 = API::Interface.call_by_title(title)
    movie1 = JSON.parse(response1)
    @movies.push(movie1)
    movie2 = find_similar_movie(movie1)
    
  end


end

private

# def find_similar_movie(movie)
#   actors = movie["Actors"]
#   # byebug
#   i = 0
#   while !similar_movie
#
#     response2 = API::Interface.call()
#   end
# end
