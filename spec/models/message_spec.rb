require 'rails_helper'

describe '#create' do
  it "メッセージがあれば保存できる" do
    message = build(:message)
    message.valid?
    expect(message).to be_valid
  end

  it "画像があれば保存できる" do
    message = build(:message)
    message.valid?
    expect(message).to be_valid
  end

  it "メッセージと画像があれば保存できる" do
    message = build(:message)
    message.valid?
    expect(message).to be_valid
  end

  it "メッセージも画像も無いと保存できない" do
    message = build(:message, body: "", image: "")
    message.valid?
    expect(message).to be_valid
  end

  it "group_idが無いと保存できない" do
    message = build(:message, group_id: "")
    message.valid?
    expect(message).to be_valid
  end

  it "user_idが無いと保存できない" do
    message = build(:message, user_id: "")
    message.valid?
    expect(message).to be_valid
  end

end
