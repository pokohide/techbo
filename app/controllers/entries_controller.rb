class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params

  end
end
