class MessagesController < ApplicationController
  before_action :group_find

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end
  def create
    @message = @group.messages.new(set_message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: 'メッセージを送信しました' }
        format.json
      end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render :new
    end
  end
  def new
  end
  def edit
  end
  def update
  end
  def show
  end

  private

  def group_find
    @group = Group.find(params[:group_id])
  end
  def set_message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end
end
