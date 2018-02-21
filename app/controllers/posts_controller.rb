class PostsController < ApplicationController
  def index
    @posts = Post.all
    @like = Like.new
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

    def upvote
    if !current_user.liked? @post
      @post.liked_by current_user
    elsif current_user.liked? @post
      # as the above method can also result nil if he is yet to vote
      @post.unliked_by current_user 
    end
  end 

  private

  def post_params
    params.require(:post).permit(:message)
  end

end