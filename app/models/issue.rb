# frozen_string_literal: true

class Issue < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :comments

  validates :title, presence: true, length: { maximum: 255, minimum: 1 }
  validates :content, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
