class PromptsController < ApplicationController
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
    @prompt = Prompt.create(prompt_params)
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

  def random
    @prompt = Prompt.random_prompt("the%20wolf%20of%20wall%20street")#Random movie gen, only ranfomizes second movie right now---change to Movies obj or move to prompt controller
    render :index
  end


  private
  def prompt_params
    params.require(:prompt).permit(:movie_a_url, :movie_b_url)
  end

end
