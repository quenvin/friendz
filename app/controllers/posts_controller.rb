class PostsController < ApplicationController
  def index
    if params[:search]
      users = User.search(params[:search])    
      posts = Post.where(user_id: users).order("created_at DESC")
      @posts = posts.paginate(:page => params[:page], :per_page => 10)
    else
      posts = Post.all.order("created_at DESC")
      @posts = posts.paginate(:page => params[:page], :per_page => 10)
    end
    @hashtags = Hashtag.all
    @posthashs = HashtagsPost.all
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    create_tags
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
      destroy_tags
      create_tags
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy;
    destroy_tags
    @post = Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def create_tags
    tags = @post.message.scan(/(?:^|\s)#(\w+)/).flatten
    tags.each {|i| 
      hashtag = Hashtag.find_by(tag: i) || Hashtag.create(tag: i)
      # Hashtag.create(tag: i) if Hashtag.find_by(tag: i) == nil
        
      HashtagsPost.create(post: Post.last, hashtag: hashtag)
    }
  end

  def destroy_tags
    posthash = HashtagsPost.where(post_id: params[:id])
    posthash.each {|i| i.destroy}
  end

end