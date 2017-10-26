class MessagesController < ApplicationController
  before_action :group_find

  def index
    new_message
    current_user_groups
  end
  def create
    @message = Message.new(set_message_params)
    if @message.save
      redirect_to new_group_messages_path
    else
      render :new
    end
  end
  def new
    @users = @group.users.map(&:name)
    @messages = Message.where(group_id: params[:group_id])
    current_user_groups
    new_message
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
    params.require(:message).permit(:body, :image, :group_id, :user_id).merge( {group_id: params[:group_id], user_id: current_user.id} )
  end
  def current_user_groups
    @groups = current_user.groups
  end
  def new_message
    @message = Message.new
  end

end
