require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Relationships' do
    it '.issue' do
      rel = described_class.reflect_on_association(:issues)
      expect(rel.macro).to eq :has_many
      expect(rel.klass).to eq ::Issue
      expect(rel.options).to match(
        through: :issue_tags,
      )
    end

    it '.issue_tags' do
      rel = described_class.reflect_on_association(:issue_tags)
      expect(rel.macro).to eq :has_many
      expect(rel.klass).to eq ::IssueTag
    end
  end
end
