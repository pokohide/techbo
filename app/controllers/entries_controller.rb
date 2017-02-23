class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @entries = Entry.not_draft.page(params[:page]).per(18)
  end

  def search
    @entries = if params[:tag].present? && params[:q].present?
      Entry.not_draft.tagged_with(params[:tag]).search_by(params[:q]).includes(:tags)
    elsif params[:tag].present?
      Entry.not_draft.tagged_with(params[:tag]).includes(:tags).desc
    elsif params[:q].present?
      Entry.not_draft.search_by(params[:q]).includes(:tags)
    else
      Entry
    end
    @entries = @entries.page(params[:page]).per(18)
    render 'index'
  end

  def show
    @comment = Comment.new
    @user = @entry.user
    if @entry.is_draft?
      redirect_to(root_path, alert: '存在しない記事です')
    else
      @entry.update(view: @entry.view + 1)
    end
  end

  def draft
    @entry = Entry.find_by(uid: params[:uid])
    gon.uid = @entry.uid
    render 'show'
  end

  def new
    @entry = current_user.entries.build
  end

  def create
    @entry = current_user.entries.new(entry_params)
    @entry.set_uid if @entry.is_draft?
    if @entry.save
      if @entry.is_draft?
        flash[:success] = '記事を作成しました。この記事はまだ公開されていません。'
        redirect_to draft_entries(@entry.uid)
      else
        flash[:success] = '記事を作成しました。'
        redirect_to entry_path(@entry)
      end
    else
      render 'new'
    end
  end

  def edit
    gon.before_body = @entry.body
  end

  def update
    gon.before_body = @entry.body
    if @entry.update(entry_params)
      flash[:success] = '記事を編集しました。'
      redirect_to entry_path(@entry)
    else
      render 'edit'
    end
  end

  def destroy
  end

  def tag_cloud
    @tags = Entry.tag_counts_on(:tags)#.order('count DESC')
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:id, :image, :title, :body, :is_draft, :tag_list)
  end
end
