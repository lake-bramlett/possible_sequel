KEYS = Dotenv.load
class MoviesController < ApplicationController

  include API

    def index



      @prompt = Prompt.movie_prompt("the%20wolf%20of%20wall%20street")#change to Movies obj or move to prompt controller
      movie_one = "titanic"
      movie_two = "inception"
      response_one = API::Interface.call_by_title(movie_one)
      response_two = API::Interface.call_by_title(movie_two)
      @response_one = JSON.parse(response_one)
      @response_two = JSON.parse(response_two)
      @title_one = JSON.parse(response_one)["Title"]
      @title_two = JSON.parse(response_two)["Title"]
      @actors_one = JSON.parse(response_one)["Actors"]
      @actors_two = JSON.parse(response_two)["Actors"]
      @plot_one = JSON.parse(response_one)["Plot"]
      @plot_two = JSON.parse(response_two)["Plot"]

    end

end
