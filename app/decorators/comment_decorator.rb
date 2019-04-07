class CommentDecorator < ApplicationDecorator
  delegate_all

  def content
    ApplicationController.helpers.simple_format(object.content)
  end
end
