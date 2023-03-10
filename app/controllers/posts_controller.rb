class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_back fallback_location: root_path
    else
      flash[:notice] = 'Failed to create post, length has to be between 1 and 1000 characters'
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    if @post.destroy
      flash[:notice] = 'Post successfully deleted.'
    else
      flash[:notice] = 'Post was not deleted, please try again.'
    end
  end

  def like
    @post = Post.all.find(params[:id])
    Like.create(user_id: current_user.id, post_id: @post.id)
    redirect_back fallback_location: root_path
  end

  def unlike
    @post = Post.all.find(params[:id])
    @like = @post.likes.find_by(user_id: current_user.id)
    @like.destroy
    redirect_back fallback_location: root_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
