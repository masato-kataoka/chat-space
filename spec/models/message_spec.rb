require 'rails_helper'
describe '#create' do
  it "is invalid without a message" do
    message = Message.new(body: "", image: "", group_id: "", user_id: "")
    body.valid?
    expect(message.errors[:body]).to include("can't be blank")
  end
end
