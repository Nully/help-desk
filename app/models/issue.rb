# frozen_string_literal: true

class Issue < ApplicationRecord
  include AASM
  include SearchCop

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :comments
  has_many :issue_tags
  has_many :tags, through: :issue_tags

  validates :title, presence: true, length: { maximum: 255, minimum: 1 }
  validates :content, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  aasm column: :issue_state do
    state :opening, initial: true
    state :discussing
    state :closed

    event :open do
      transitions from: :closed, to: :opening
    end

    event :discuss do
      transitions from: :opening, to: :discussing
    end

    event :close do
      transitions from: :discussing, to: :closed
    end
  end

  search_scope :search do
    attributes :title, :content
    attributes comment: ['comments.content']
  end
end
