class Admin::PostsController < ApplicationController


  before_action :set_post, only:  [:show, :destroy]

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
    flash[:alert] = "post was deleted"
  end


  private
  #other code
 def set_post
   @post = Post.find(params[:id])
 end

 def post_params
   params.require(:post).permit(:id, :message)
 end

end
