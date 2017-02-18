class CommentsController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.new(comment_params)
    if user_signed_in?
      @comment.user_id = current_user.id
    end
    @err = @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:from, :body, :avatar)
  end
end
