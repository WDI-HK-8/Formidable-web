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
    @submission = Submission.find(params[:id])
    if @submission.nil?
      render json: {message: "Cannot find submission"}, status: :not_found
    else 
      if @submission.destroy
        render json: {deleted: true}, status: :success
      else
        render json: {deleted: false}, status: :bad_request
      end
    end
  end
end
