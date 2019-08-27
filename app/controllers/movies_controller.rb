KEYS = Dotenv.load
class MoviesController < ApplicationController

  include API

    def index

      # response = API::Interface.call_by_title("wolf%20of%20wall%20street")
      @prompt = Prompt.movie_prompt("the%20wolf%20of%20wall%20street")
      byebug
      # response = API::Interface.call("inception")
      #
      # @movies = JSON.parse(response)
      # @prompt = Prompt.movie_prompt("titanic")
    end

end
