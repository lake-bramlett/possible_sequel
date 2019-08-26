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


  private
  def prompt_params
    params.require(:prompt).permit(:movie_a_url, :movie_b_url)
  end

end
