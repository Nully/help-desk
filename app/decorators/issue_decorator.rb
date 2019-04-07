class IssueDecorator < Draper::Decorator
  delegate_all

  def content
    object.content.gsub("\n", '<br />').html_safe
  end

  def created_at
    I18n.l(object.created_at, format: :long)
  end

  def updated_at
    I18n.l(object.updated_at, format: :long)
  end
end
