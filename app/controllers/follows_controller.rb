class FollowsController < ApplicationController
    def create
        follow = Post.find(params[:id])
        Relationship.create(following_id: follow.user.id, follower: current_user)
        @posts = Post.all
        render :toggle    
      end
    
      def destroy
        @post = Post.find(params[:id])
        @relationship = Relationship.find_by(following_id: follow.user.id, follower: current_user)
        @relationship.destroy
        @posts = Post.all
        render :toggle
      end
end

