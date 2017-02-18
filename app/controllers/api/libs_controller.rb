class Api::LibsController < ApplicationController
  include MarkdownHelper

  def md_view
    md = markdown(params[:text])
    render json: md, status: 200
  end
end
