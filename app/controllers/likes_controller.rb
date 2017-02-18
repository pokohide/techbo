class LikesController < ApplicationController
  before_action :set_entry, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, entry_id: @entry.id)
    @entry.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, entry_id: @entry.id)
    like.destroy
    @entry.reload
  end

  private

  def set_entry
    @entry = Entry.find(params[:entry_id])
  end
end
