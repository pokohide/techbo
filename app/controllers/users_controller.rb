class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:me, :edit, :update]

  def show
    @user = User.find(params[:id])
    @entries = @user.not_draft.entries
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
    @user = current_user
    @entries = @user.entries
    @total_views = @entries.inject(0) { |sum, entry| sum + entry.view }
    @total_likes = @entries.inject(0) { |sum, entry| sum + entry.likes_count }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
