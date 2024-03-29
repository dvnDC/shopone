class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_url
    else
      @feed_comments = current_user.feed.paginate(page:params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to root_url, status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end
end
