class UsersController < ApplicationController
  before_action :user_find

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      # 更新に成功したときの処理
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def user_find
    @user = User.find(params[:id])
  end
end
