class UsersController < ApplicationController
  def sign_in
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
#    if @user.update_attributes(params.require(:user).permit(:name, :email))
    if @user.update_attributes(user_params)
      # 更新に成功したときの処理
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
