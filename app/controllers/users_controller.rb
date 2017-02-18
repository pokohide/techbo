class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @entries = @user.entries
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = 'ユーザ情報を編集しました。'
      redirect_to me_path
    else
      render 'edit'
    end
  end

  def me
    if user_signed_in?
      @user = current_user
      @entries = @user.entries
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
