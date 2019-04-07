class CommentsController < ApplicationController
  before_action :find_issue, only: :create

  def create
    @comment = Comment.new(permitted_params)

    unless @comment.valid?
      flash[:erorr] = @comment.errors.full_messages
      return redirect_to(issue_path(id: permitted_params[:issue_id]))
    end

    @issue.comments << @comment

    flash[:success] = '回答を登録しました'
    redirect_to issue_path(id: @comment.issue_id)
  end

  private

  def permitted_params
    params.require(:comment).permit(:issue_id, :email, :content)
  end

  def find_issue
    @issue = Issue.find(permitted_params[:issue_id])
  end
end
