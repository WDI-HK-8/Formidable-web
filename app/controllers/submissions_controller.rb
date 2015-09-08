class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.where(params[:submission_key])
  end

  def create
    @submission = Content.find(params[:content_id]).submissions.create(submission_params)
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
    @submissions = Content.find(params[:content_id]).submissions
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
    params.require(:submission).permit(:answer,:submission_key)
  end
end
