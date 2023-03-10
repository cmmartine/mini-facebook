class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.create(comment_params)

    if @comment.save
      redirect_back fallback_location: root_path
    else
      flash[:notice] = 'Failed to create comment, length has to be between 1 and 500 characters'
      redirect_back fallback_location: root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
