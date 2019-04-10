# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :issue_tags
  has_many :issues, through: :issue_tags
end
