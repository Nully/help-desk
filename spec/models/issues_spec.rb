require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'Validations' do
    before { record.valid? }
    subject { record.valid? }

    describe '#title' do
      context '空の場合' do
        let(:record) { build :issue, title: nil }

        it { is_expected.to be_falsy }
      end

      context '255文字以上の場合' do
        let(:record) { build :issue, title: '1' * 256 }

        it { is_expected.to be_falsy }
      end
    end

    describe '#content' do
      context '空の場合' do
        let(:record) { build :issue, title: nil }

        it { is_expected.to be_falsy }
      end
    end

    describe '#email' do
      context '空の場合' do
        let(:record) { build :issue, email: nil }

        it { is_expected.to be_falsy }
      end

      context '不正なメアドの場合' do
        let(:record) { build :issue, email: 'aaa' }

        it { is_expected.to be_falsy }
      end
    end
  end
end
