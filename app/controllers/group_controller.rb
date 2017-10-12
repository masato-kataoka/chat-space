class GroupController < ApplicationController

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

  def index
    @group = Group.find(params[:group_id])
  end

  def update
    if @group.update_attributes(set_group_params)
      # 更新に成功したときの処理
    else
      render 'edit'
    end
  end

  private

  def set_group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
