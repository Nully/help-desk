class IssuesController < ApplicationController
  before_action :build_issues, only: :index
  before_action :build_issue, onlye: :new
  before_action :build_comment, only: :show
  before_action :find_issue, only: %i[show update]
  before_action :find_comments, only: :show
  before_action :find_tags, only: :show

  def index
  end

  def new
  end

  def create
    @issue = Issue.new(permitted_params)
    unless @issue.valid?
      flash[:error] = @issue.errors.full_messages
      return render :new
    end

    @issue.save!

    flash[:success] = '質問を登録しました'
    redirect_to issues_path
  end

  def update

    unless @issue.update(issue_state: params[:issue_state])
      flash[:error] = ['ステータスの更新に失敗しました']
    else
      flash[:success] = 'ステータスを更新しました'
    end

    redirect_to issue_path(id: params[:id])
  end

  private

  def permitted_params
    params.require(:issue).permit(:email, :title, :content)
  end

  def build_issues
    @issues = IssueDecorator.decorate_collection(
      Issue.all.order(updated_at: :desc).page(params[:page])
    )

    if params[:search].present?
      @issues = @issues.search(params[:search])
    end
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

  def find_tags
    @tags = @issue.tags
  end
end
