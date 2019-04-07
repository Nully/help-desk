class CommentsController < ApplicationController
  def create
    @comment = Comment.new(permitted_params)

    unless @comment.valid?
      return render(:show)
    end

    @comment.save!

    redirect_to issue_path(id: @comment.issue_id), success: '回答を登録しました'
  end

  private

  def permitted_params
    params.require(:comment).permit(:issue_id, :content)
  end
end
