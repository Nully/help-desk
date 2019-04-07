# frozen_string_literal: true

class Comment < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  belongs_to :issue, inverse_of: :comments

  validates :content, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
