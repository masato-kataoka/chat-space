class MessagesController < ApplicationController
  def index
    @message = Message.new
  end
  def create
    @message = Message.new(params.require(:message).permit(:title, :body))
  end
end
