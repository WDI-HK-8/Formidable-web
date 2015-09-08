class SubmissionsController < ApplicationController
  def index
    @submissions = Form.find(params[:form_id]).submissions
  end

  def create
    @submission = Form.find(params[:form_id]).submissions.create(submission_params)
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.nil?
      render json: {message: "Cannot find submission"}, status: :not_found
    else
      @submission.update(submission_params)
      render json: {updated: true}, status: :success
    end
  end

  def delete
    @submissions = Form.find(params[:form_id]).submissions
    if @submissions.nil?
      render json: {message: "Cannot find submissions"}, status: :not_found
    else
      @submissions.each do |submission|
        submission.destroy
      end
      render json: {deleted: true}, status: :success
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:name,:content)
  end
end
