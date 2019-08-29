KEYS = Dotenv.load
class PromptsController < ApplicationController
  include API
  before_action :authorize

  def secret
  end

  def index
    @prompts = Prompt.all
    render :index
  end

  def new
    @prompt = Prompt.new
    render :new
  end

  def create
    movie_one = params["prompt"]["movie_a"]
    movie_two = params["prompt"]["movie_b"]
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

  def edit
    @prompt = Prompt.find(params[:id])
    render :edit
  end

  def show
    @post = Post.new
    @prompt = Prompt.find(params[:id])
    @answers = Post.get_by_prompt(@prompt["id"])
    @title_one = @prompt["movie_a"]["title"]
    @title_two = @prompt["movie_b"]["title"]
    @actors_one = @prompt["movie_a"]["actors"]
    @actors_two = @prompt["movie_b"]["actors"]
    @plot_one = @prompt["movie_a"]["plot"]
    @plot_two = @prompt["movie_b"]["plot"]
    @poster_one = @prompt["movie_a"]["poster"]
    @poster_two = @prompt["movie_b"]["poster"]
    render :show
  end

  def update
    @prompt = Prompt.find(params[:id])
    movie_one = params["prompt"]["movie_a"]
    movie_two = params["prompt"]["movie_b"]
    response_one = API::Interface.call_by_title(movie_one)
    response_two = API::Interface.call_by_title(movie_two)
    if @prompt.update(movie_a: {title: JSON.parse(response_one)["Title"], year: JSON.parse(response_one)["Year"], actors: JSON.parse(response_one)["Actors"], plot: JSON.parse(response_one)["Plot"], poster: JSON.parse(response_one)["Poster"]}, movie_b: {title: JSON.parse(response_two)["Title"], year: JSON.parse(response_two)["Year"], actors: JSON.parse(response_two)["Actors"], plot: JSON.parse(response_two)["Plot"], poster: JSON.parse(response_two)["Poster"]})
      redirect_to prompts_path
    else
      render :edit
    end
  end

  def destroy
    @prompt = Prompt.find(params[:id])
    @prompt.destroy
    redirect_to prompts_path
  end

  def random
    @post = Post.new
    @random = Prompt.random_prompt#Random movie gen, only ranfomizes second movie right now---change to Movies obj or move to prompt controller
    movie_one = @random[0]["Title"]
    movie_two = @random[1]["Title"]
    response_one = JSON.parse(API::Interface.call_by_title(movie_one))
    response_two = JSON.parse(API::Interface.call_by_title(movie_two))
    byebug
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
      render :random
    else
      flash[:alert] = "Please fill out all fields"
      render :new
    end
  end

def save_random
  movie_one = params["prompt"]["movie_a"]
  movie_two = params["prompt"]["movie_b"]
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


  private
  def prompt_params
    params.require(:prompt).permit(:movie_a_url, :movie_b_url)
  end

end
