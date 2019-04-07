require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'Validations' do
    subject { record.valid? }

    describe '#title' do
      context '空の場合' do
        let(:record) { build :issue, title: nil }

        it { is_expected.to be_falsy }
        it {
          record.valid?
          expect(record.errors[:title]).to include('を入力してください')
          expect(record.errors[:title]).to include('は1文字以上で入力してください')
        }
      end

      context '255文字以上の場合' do
        let(:record) { build :issue, title: '1' * 256 }

        it { is_expected.to be_falsy }
        it {
          record.valid?
          expect(record.errors[:title]).to include('は255文字以内で入力してください')
        }
      end
    end

    describe '#content' do
      context '空の場合' do
        let(:record) { build :issue, title: nil }

        it { is_expected.to be_falsy }
        it {
          record.valid?
          expect(record.errors[:title]).to include('を入力してください')
        }
      end
    end
  end
end
