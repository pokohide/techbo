class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, entry_id: params[:entry_id])
    @likes = Like.where(entry_id: params[:entry_id])
    @entries = Entry.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, entry_id: params[:entry_id])
    like.destroy
    @likes = Like.where(entry_id: params[:entry_id])
    @entries = Entry.all
  end
end
