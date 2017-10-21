class MessagesController < ApplicationController
  def index
    @message = Message.new
    @group = current_user.group
  end
  def create
    @message = Message.new(params.require(:message).permit(:body, :image))
  end
  def new
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users.map(&:name)
    @message = Message.new
  end
  def edit
  end
  def update
    @message = Group.find(params[:id])
  end
  def show
    @group = Group.find(params[:group_id])
  end
end
