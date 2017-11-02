class GroupsController < ApplicationController
  before_action :group_find, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(set_group_params)
    if @group.save
      flash[:notice] = 'グループを作成しました'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def index
    @message = Message.new
    @groups = current_user.groups
  end

  def update
    if @group.update_attributes(set_group_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def show
  end

  private

  def set_group_params
    params.require(:group).permit(:name, user_ids:[])
  end
  def group_find
    @group = Group.find(params[:id])
  end
end
