# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :issue, inverse_of: :comments

  validates :content, presence: true
end
