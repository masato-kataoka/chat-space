class MessagesController < ApplicationController
  def index
    @message = Message.new
    @group = current_user.group
  end
  def create
    @message = Message.new(params.require(:message).permit(:title, :body))
  end
  def new
  end
  def edit
  end
  def update
  end
end
