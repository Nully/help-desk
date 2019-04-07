class IssuesController < ApplicationController
  before_action :build_issues, only: :index
  before_action :build_issue, onlye: :new

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
end
