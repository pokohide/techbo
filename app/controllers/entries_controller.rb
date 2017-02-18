class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @entries = Entry.all.page(params[:page])
  end

  def show
    @comment = Comment.new
  end

  def new
    @entry = current_user.entries.build
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      flash[:success] = '記事を作成しました。'
      redirect_to entry_path(@entry)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      flash[:success] = '記事を編集しました。'
      redirect_to entry_path(@entry)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:id, :image, :title, :body, :is_draft)
  end
end
