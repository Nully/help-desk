require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validators' do
    subject { record.valid? }

    describe '#content' do
      context '空の場合' do
        let(:record) { build :comment, content: nil }

        it { is_expected.to be_falsy }
      end
    end

    describe '#email' do
      context '空の場合' do
        let(:record) { build :comment, email: nil }

        it { is_expected.to be_falsy }
      end

      context '不正なメアドの場合' do
        let(:record) { build :comment, email: 'aaaa' }

        it { is_expected.to be_falsy }
      end
    end
  end
end
