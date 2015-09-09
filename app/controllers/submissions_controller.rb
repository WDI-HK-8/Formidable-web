class SubmissionsController < ApplicationController
  def index
    @submissions = User.find(params[:user_id]).submissions.includes(:answers)
  end

  def create
    @submission = User.find(params[:user_id]).submissions.create()
  end

  def show
    @submission = Submission.find(params[:id]).includes(:answers)
  end

  def delete
    @submissions = User.find(params[:user_id]).submissions
    if @submissions.nil?
      render json: {message: "Cannot find submissions"}, status: :not_found
    elsif @submissions.destroy_all
      render json: {deleted: true}, status: :success
    end
  end
end
