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
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
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

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
