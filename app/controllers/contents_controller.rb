class ContentsController < ApplicationController
  def index
    @contents = Form.find(params[:form_id]).contents.includes(:submissions)
  end

  def create
    binding.pry
    @content = Form.find(params[:form_id]).contents.create(content_params)
  end

  def update
    @content = Content.find(params[:id])
    if @content.nil?
      render json: {message: 'Cannot find content'}, status: :not_found
    else 
      if @content.update(content_params)
        render json: {updated: true}, status: :success
      else
        render json: {updated: false}, status: :bad_request
      end
    end
  end

  def destroy
    @content = Content.find(params[:id])
    if @content.nil?
      render json: {message: 'Cannot find content'}, status: :not_found
    else 
      if @content.destroy
        render json: {deleted: true}, status: :success
      else
        render json: {deleted: false}, status: :bad_request
      end
    end
  end

  private

  def content_params
    params.require(:content).permit(:category,:index,:label,:options)
  end
end
