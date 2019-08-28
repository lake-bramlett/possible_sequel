class MoviesController < ApplicationController

  include API

    def index

    end

    def manual
      @post = Post.new
      prompt = ActiveRecord::Base.connection.execute("SELECT * FROM prompts ORDER BY random() LIMIT(1)").first
      @prompt = Prompt.find(prompt["id"])
      @title_one = @prompt["movie_a"]["title"]
      @title_two = @prompt["movie_b"]["title"]
      @actors_one = @prompt["movie_a"]["actors"]
      @actors_two = @prompt["movie_b"]["actors"]
      @plot_one = @prompt["movie_a"]["plot"]
      @plot_two = @prompt["movie_b"]["plot"]
      @poster_one = @prompt["movie_a"]["poster"]
      @poster_two = @prompt["movie_b"]["poster"]
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
      @poster_one = @prompt[0]["Poster"]
      @poster_two = @prompt[1]["Poster"]
      render :index
    end
end
