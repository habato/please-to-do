require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの新規投稿' do
    context 'コメントの新規投稿ができる時' do
      it '必要な情報を適切に入力すれば作成できること' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントの新規投稿ができない時' do
      it 'textが空では作成できないこと' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it 'requestが紐付いていないと投稿できないこと' do
        @comment.request = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Request must exist')
      end

      it 'userが紐付いていないと投稿できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
    end
  end
end
