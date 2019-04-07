# frozen_string_literal: true

class Issue < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255, minimum: 1 }
  validates :content, presence: true
end
