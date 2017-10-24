class MessagesController < ApplicationController
  def index
    @message = Message.new
    @group = current_user.group
  end
  def create
    binding.pry
    Message.create(body: params.require(:message)[:body], image: params.require(:message)[:image], group_id: params[:group_id], user_id: current_user.id)
  end
  def new
#    binding.pry
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users.map(&:name)
    @messages = current_user.messages.where(group_id: params[:group_id])
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
