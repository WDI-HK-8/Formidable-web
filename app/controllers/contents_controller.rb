class ContentsController < ApplicationController
  def index
    @contents = Form.find(params[:form_id]).contents.includes(:submissions)
  end

  def create
    @content = Form.find(params[:form_id]).contents.create(content_params)
  end

  def update
    @content = Content.find(params[:id])
    if @content.nil?
      render json: {message: 'Cannot find content'}, status: :not_found
    elsif @content.update(content_params)
      render json: {updated: true}, status: :success
    end
  end

  def delete
    @content = Content.find(params[:id])
    if @content.nil?
      render json: {message: 'Cannot find content'}, status: :not_found
    elsif @content.destroy
      render json: {deleted: true}, status: :success
    end
  end

  private

  def content_params
    params.require(:content).permit(:type,:index,:label,:options)
  end
end
