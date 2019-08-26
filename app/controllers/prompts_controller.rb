class PromptsController < ApplicationController

  def index
    @prompts = Prompt.all
    render :index
  end

  def new
    @prompt = Prompt.new
    render :new
  end

  def create
    binding.pry
    movie_a_title = :movie_a_url
    movie_b_title = :movie_b_url
    @prompt = Prompt.create(movie_a_url: "test.com/#{movie_a_title}", movie_b_url: "test.com/#{movie_b_title}")
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
    @prompt = Prompt.find(params[:id])
    render :show
  end

  def update
    @prompt = Prompt.find(params[:id])
    if @prompt.update(prompt_params)
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

  private
  def prompt_params
    movie_a_title = :movie_a_url
    movie_b_title = :movie_b_url
    movie_a = "api.com/#{movie_a_title}"
    movie_b = "api.com/#{movie_b_title}"
    params.require(:prompt).permit(:movie_a_url, :movie_b_url)
  end

end
