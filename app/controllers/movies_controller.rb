class MoviesController < ApplicationController

  include API

    def index
      response = API::Interface.call("titanic")
      @movies = JSON.parse(response)
    end

end
