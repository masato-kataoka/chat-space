class GroupController < ApplicationController

  def new
  end

  def create
  end

  def index
    @group = Group.new
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
    params.require(:groups).permit(:name)
  end

end
