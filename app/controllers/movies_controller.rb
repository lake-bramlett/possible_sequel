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
      render :index
    end

    def random
      @prompt = Prompt.random_prompt("the%20wolf%20of%20wall%20street")#send down to #random
      @title_one = @prompt[0]["Title"]
      @title_two = @prompt[1]["Title"]
      @actors_one = @prompt[0]["Actors"]
      @actors_two = @prompt[1]["Actors"]
      @plot_one = @prompt[0]["Plot"]
      @plot_two = @prompt[1]["Plot"]
      render :index
    end
end
