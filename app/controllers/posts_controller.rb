class PostsController < ApplicationController

  def index
    @posts = Post.order(id: :desc)
  end

  def new
    unless current_user
      flash[:alert] = "You must be logged in to create a post"
      redirect_to posts_path
    else
      @post = Post.new
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def create
    @post = current_user.posts.create post_params
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end


end
