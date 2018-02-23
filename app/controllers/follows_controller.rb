class FollowsController < ApplicationController
    def create
        follow = Post.find(params[:id])
        Relationship.create(following_id: follow.user.id, follower: current_user)
        @posts = Post.all.order("created_at DESC")
        render :toggle    
      end
    
      def destroy
        follow = Post.find(params[:id])
        @relationship = Relationship.find_by(following_id: follow.user.id, follower: current_user)
        @relationship.destroy
        @posts = Post.all.order("created_at DESC")
        render :toggle
      end
end

