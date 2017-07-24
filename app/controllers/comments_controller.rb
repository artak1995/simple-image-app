class CommentsController < ApplicationController

  def new
    @comment = Comment.new(pic_id: params[:pic_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path, notice: 'Comment Added'
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :pic_id)
  end

end
