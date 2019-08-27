class PostsController < ApplicationController

  def new
    @prompt = Prompt.find(params[:prompt_id])
    @post = @prompt.posts.new
    render :new
  end

  def create
    binding.pry
    @user = current_user

    @prompt = Prompt.find(params[:prompt_id])
    @post = @prompt.posts.new(body: post_params["body"], user_id: @user.id)
    if @prompt.save
      flash[:notice] = "Post successfully added!"
      redirect_to prompt_path(@prompt)
    else
      flash[:alert] = "Please fill out all fields"
      render :new
    end
  end

  def show
    @prompt = Prompt.find(params[:prompt_id])
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @prompt = Prompt.find(params[:prompt_id])
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to prompt_path(@post.prompt)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to prompt_path(@post.prompt)
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
