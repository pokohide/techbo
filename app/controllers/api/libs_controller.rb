class Api::LibsController < ApplicationController
  include MarkdownHelper

  def md_view
    md = markdown(params[:text])
    render json: md, status: 200
  end

  def diffy
    diff = diff_for(params[:before], params[:after])
    render json: diff, status: 200
  end
end
