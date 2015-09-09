class SubmissionsController < ApplicationController
  def index
    @submissions = Form.find(params[:form_id]).submissions.includes(:answers)
  end

  def create
    @submission = Form.find(params[:form_id]).submissions.create()
  end

  def show
    @submission = Submission.find(params[:id]).includes(:answers)
  end

  def delete
    @submissions = Form.find(params[:form_id]).submissions
    if @submissions.nil?
      render json: {message: "Cannot find submissions"}, status: :not_found
    else 
      if @submission.destroy_all
        render json: {deleted: true}, status: :success
      else
        render json: {deleted: false}, status: :bad_request
      end
    end
  end
end
