class LikesController < ApplicationController

  def create
    Like.create(post_id: params[:id], user: current_user)
    @posts = Post.all.order("created_at DESC")
    render :toggle
  end



  def destroy
    like = Like.find_by(post_id:params[:id])
    like.destroy
    @posts = Post.all.order("created_at DESC")
    render :toggle
  end

  private

  def likes_params
    params.require(:like).permit(:post_id, :user_id)
  end

end
