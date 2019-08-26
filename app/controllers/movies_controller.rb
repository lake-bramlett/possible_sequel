KEYS = Dotenv.load
class MoviesController < ApplicationController

  include API

    def index

      response = API::Interface.call("leonardo dicaprio")
      @movies = JSON.parse(response)
      # @prompt = Prompt.movie_prompt("titanic")
      # response = API::Interface.call("inception")
      #
      # @movies = JSON.parse(response)
      # @prompt = Prompt.movie_prompt("titanic")
    end

end
