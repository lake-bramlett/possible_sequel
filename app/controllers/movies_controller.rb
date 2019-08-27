class MoviesController < ApplicationController

  include API

    def index

      @prompt = Prompt.movie_prompt("the%20wolf%20of%20wall%20street")#send down to #random
    end

    def manual
      @prompt = Prompt.manual_prompt("titanic", "inception")
      @title_one = @prompt[0]["Title"]
      @title_two = @prompt[1]["Title"]
      @actors_one = @prompt[0]["Actors"]
      @actors_two = @prompt[1]["Actors"]
      @plot_one = @prompt[0]["Plot"]
      @plot_two = @prompt[1]["Plot"]
      byebug
      render :index
    end

    def random
    end
end
