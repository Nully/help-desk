require 'rails_helper'

RSpec.describe IssueTag, type: :model do
  describe 'Relationships' do
    it '.issue' do
      rel = described_class.reflect_on_association(:issue)
      expect(rel.macro).to eq :belongs_to
      expect(rel.klass).to eq ::Issue
    end

    it '.tag' do
      rel = described_class.reflect_on_association(:tag)
      expect(rel.macro).to eq :belongs_to
      expect(rel.klass).to eq ::Tag
    end
  end
end
