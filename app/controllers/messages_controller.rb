class MessagesController < ApplicationController
  before_action :group_find

  def index
    @message = Message.new
    @groups = current_user_groups
  end
  def create
    @message = Message.new(body: set_message_params[:body], image: set_message_params[:image], group_id: params[:group_id], user_id: current_user.id)
    if @message.save
      redirect_to new_group_messages_path
    else
      render :new
    end
  end
  def new
    @groups = current_user_groups
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
  end

  private

  def group_find
    @group = Group.find(params[:group_id])
  end
  def set_message_params
    params.require(:message).permit(:body, :image, :group_id, :user_id)
  end
  def current_user_groups
    current_user.groups
  end
end
