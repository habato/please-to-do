require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @request = FactoryBot.build(:request)
  end

  describe 'リクエストの新規投稿' do
    context 'リクエストの新規投稿ができる時' do
      it '必要な情報を適切に入力すれば投稿できること' do
        expect(@request).to be_valid
      end

      it 'imageが空でも投稿できること' do
        @request.image = nil
        expect(@request).to be_valid
      end
    end

    context 'リクエストの新規投稿ができない時' do
      it 'titleが空では投稿できないこと' do
        @request.title = ''
        @request.valid?
        expect(@request.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空では投稿できないこと' do
        @request.content = ''
        @request.valid?
        expect(@request.errors.full_messages).to include("Content can't be blank")
      end

      it 'roomが紐付いていないと投稿できないこと' do
        @request.room = nil
        @request.valid?
        expect(@request.errors.full_messages).to include('Room must exist')
      end

      it 'userが紐付いていないと投稿できないこと' do
        @request.user = nil
        @request.valid?
        expect(@request.errors.full_messages).to include('User must exist')
      end
    end
  end
end
