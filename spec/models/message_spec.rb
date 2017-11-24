require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'メッセージを保存できる場合' do
      it 'メッセージがあれば保存できる' do
        expect(build(:message, image: nil)).to be_valid
      end

      it '画像があれば保存できる' do
        expect(build(:message, body: nil)).to be_valid
      end

      it 'メッセージと画像があれば保存できる' do
        expect(build(:message)).to be_valid
      end
    end

    context 'メッセージを保存できない場合' do
      it 'メッセージも画像も無いと保存できない' do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors[:body]).to include('を入力してください')
      end
#      it 'group_idが無いと保存できない' do
#      end
#      it 'user_idが無いと保存できない' do
#      end
    end
  end
end
