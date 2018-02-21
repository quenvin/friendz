class LikesController < ApplicationController

  def create
    # byebug
    # @like = Like.create(likes_params)
    Like.create(post_id: params[:id], user: current_user)
    # @post = @like.post
    @posts = Post.all
    render :toggle
  end



  def destroy
    like = Like.find_by(post_id:params[:id])
    like.destroy
    @posts = Post.all
    render :toggle
  end

  private

  def likes_params
    params.require(:like).permit(:post_id, :user_id)
  end

end
