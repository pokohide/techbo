class LikesController < ApplicationController
  before_action :set_entry, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(entry_id: @entry.id)
  end

  def destroy
    like = current_user.likes.find_by(entry_id: @entry.id)
    like.destroy
  end

  private

  def set_entry
    @entry = Entry.find(params[:entry_id])
  end
end
