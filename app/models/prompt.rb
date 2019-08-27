class Prompt < ApplicationRecord
  include API
  has_many :posts

  def self.movie_prompt(title)
    @movies = []
    response1 = API::Interface.call_by_title(title)
    movie1 = JSON.parse(response1)
    @movies.push(movie1)
    movie2 = find_similar_movie(movie1)
    length = movie2["results"][0]["known_for"].length
    movie2 = movie2["results"][0]["known_for"][rand(0..(length-1))]["title"]
    response2 = API::Interface.call_by_title(movie2)
    movie2 = JSON.parse(response2)
    @movies.push(movie2)
    return @movies
  end


end

private

def find_similar_movie(movie)
  actors = movie["Actors"]
  response2 = API::Interface.call_by_actor(actors)
  similar_movie = JSON.parse(response2)
end
