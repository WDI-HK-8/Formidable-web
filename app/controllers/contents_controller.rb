class ContentsController < ApplicationController
  def index
    @contents = Form.find(params[:id]).contents.includes(:submissions)
  end

  def create
    @content = Form.find(params[:id]).contents.create(content_params)
  end

  def update
    @content = Content.find(params[:id])
    if @content.nil?
      render json: {message: 'Cannot find content'}, status: :not_found
    else
      @content.update(content_params)
    end
  end

  def delete
    @content = Content.find(params[:id])
    if @content.nil?
      render json: {message: 'Cannot find content'}, status: :not_found
    else
      @content.destroy
      render json: {deleted: true}, status: :success
    end
  end

  private

  def content_params
    params.require(:content).permit(:type,:index,:label,:options)
  end
end
