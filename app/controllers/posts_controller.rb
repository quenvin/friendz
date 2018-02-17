class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)
    post.save
    redirect_to posts_path
  end

  def show
    @posts = current_user.posts
  end

  def edit; 
    @post = Post.find(params[:id])
  end

  def update;
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy; 
    @post = Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end