class MoviesController < ApplicationController

  include API

    def index

    end

    def from_db
      @post = Post.new
      prompt = ActiveRecord::Base.connection.execute("SELECT * FROM prompts ORDER BY random() LIMIT(1)").first
      @answers = Post.get_by_prompt(prompt["id"])
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
      @random = Prompt.new
      @post = Post.new
      @prompt = Prompt.random_prompt#send down to #random
      @title_one = @prompt[0]["Title"]
      @title_two = @prompt[1]["Title"]
      @actors_one = @prompt[0]["Actors"]
      @actors_two = @prompt[1]["Actors"]
      @plot_one = @prompt[0]["Plot"]
      @plot_two = @prompt[1]["Plot"]
      @poster_one = @prompt[0]["Poster"]
      @poster_two = @prompt[1]["Poster"]
      render :random
    end

    def save_random
      byebug
      @random = Prompt.new
      movie_one = @title_one
      movie_two = @title_two
      response_one = JSON.parse(API::Interface.call_by_title(movie_one))
      response_two = JSON.parse(API::Interface.call_by_title(movie_two))
      @prompt = Prompt.create(movie_a: {
                                title: response_one["Title"],
                                year: response_one["Year"],
                                actors: response_one["Actors"],
                                plot: response_one["Plot"],
                                poster: response_one["Poster"]},
                              movie_b: {
                                title: response_two["Title"],
                                year: response_two["Year"],
                                actors: response_two["Actors"],
                                plot: response_two["Plot"],
                                poster: response_two["Poster"]}
                              )
      if @prompt.save
        flash[:notice] = "Prompt successfully created!"
        redirect_to prompts_path
      else
        flash[:alert] = "Please fill out all fields"
        render :new
      end
    end
end
