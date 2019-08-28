class MoviesController < ApplicationController

  include API

    def index

    end

    def manual
      @prompt = Prompt.manual_prompt("titanic", "inception")
      @title_one = @prompt[0]["Title"]
      @title_two = @prompt[1]["Title"]
      @actors_one = @prompt[0]["Actors"]
      @actors_two = @prompt[1]["Actors"]
      @plot_one = @prompt[0]["Plot"]
      @plot_two = @prompt[1]["Plot"]
      @poster_one = @prompt[0]["Poster"]
      @poster_two = @prompt[1]["Poster"]
      render :index
    end

    def random
      @prompt = Prompt.random_prompt#send down to #random
      @title_one = @prompt[0]["Title"]
      @title_two = @prompt[1]["Title"]
      @actors_one = @prompt[0]["Actors"]
      @actors_two = @prompt[1]["Actors"]
      @plot_one = @prompt[0]["Plot"]
      @plot_two = @prompt[1]["Plot"]
      render :index
    end
end
