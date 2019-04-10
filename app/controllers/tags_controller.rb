# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :build_tags, only: :index
  before_action :find_tag_and_issues, only: :show

  def index
  end

  def show
    return render('tags/tag_not_found') if @tag.blank?
  end

  private

  def build_tags
    @tags = TagDecorator.decorate_collection(
      Tag.all.order(updated_at: :desc).page(params[:page])
    )
  end

  def find_tag_and_issues
    @tag = Tag.find_by(name: params[:slug])
    @issues = IssueDecorator.decorate_collection(
      @tag.issues.order(updated_at: :desc).page(params[:page])
    )
  end
end
