class UsersController < ApplicationController

  def edit
    user_find
  end

  def update
    if current_user.update(set_user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def set_user_params
    params.require(:user).permit(:name, :email)
  end

  def user_find
    @user = User.find(params[:id])
  end
end
