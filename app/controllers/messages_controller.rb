class MessagesController < ApplicationController
  def index
    @message = Message.new
    @group = current_user.group
  end
  def create
    Message.create(body: params.require(:message)[:body], image: params.require(:message)[:image], group_id: params[:group_id], user_id: current_user.id)
    redirect_to new_group_messages_path
  end
  def new
    group_find
    @groups = current_user.groups
    @users = @group.users.map(&:name)
    @messages = Message.where(group_id: params[:group_id])
    @message = Message.new
  end
  def edit
  end
  def update
    @message = Group.find(params[:id])
  end
  def show
    group_find
  end

  private
  def group_find
    @group = Group.find(params[:group_id])
  end
end
