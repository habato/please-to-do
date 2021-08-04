require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム新規作成' do
    context 'ルームの新規作成ができる時' do
      it '必要な情報を適切に入力すれば作成できること' do
        expect(@room).to be_valid
      end
    end

    context 'ルームの新規作成ができない時' do
      it 'nameが空では作成できないこと' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
