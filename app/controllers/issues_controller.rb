class IssuesController < ApplicationController
  before_action :build_issues, only: :index
  before_action :build_issue, onlye: :new
  before_action :build_comment, only: :show
  before_action :find_issue, only: :show
  before_action :find_comments, only: :show

  def index
  end

  def new
  end

  def create
    @issue = Issue.new(permitted_params)
    unless @issue.valid?
      return render :new
    end

    @issue.save!

    redirect_to issues_path, success: '質問を登録しました。'
  end

  private

  def permitted_params
    params.require(:issue).permit(:title, :content)
  end

  def build_issues
    @issues = Issue.all.order(updated_at: :desc).page(params[:page])
  end

  # Build a new Issue instance
  def build_issue
    @issue = Issue.new
  end

  def build_comment
    @comment = Comment.new
  end

  def find_issue
    @issue = Issue.find(params[:id]).decorate
  end

  def find_comments
    @comments = CommentDecorator.decorate_collection(
      @issue.comments
    )
  end
end
