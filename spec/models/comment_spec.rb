require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validators' do
    before { record.valid? }

    subject { record.valid? }

    context 'content' do
      describe '空の場合' do
        let(:record) { build :comment, content: nil }
        it { is_expected.to be_falsy }
        it { expect(record.errors[:content]).to include('を入力してください') }
      end
    end
  end
end
