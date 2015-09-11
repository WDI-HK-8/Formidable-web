class SubmissionsController < ApplicationController
  def index
    @submissions = Form.find(params[:form_id]).submissions.includes(:answers)
  end

  def create
    @submission = Form.find(params[:form_id]).submissions.create()
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def destroy
    @submission = Submission.find(params[:id])
    if @submission.nil?
      render json: {message: "Cannot find submission"}, status: :not_found
    else 
      if @submission.destroy
        render json: {deleted: true}
      else
        render json: {deleted: false}, status: :bad_request
      end
    end
  end

  def list
    forms = User.find(params[:user_id]).forms
    @submissions = []
    forms.each do |form|
      form.submissions.each do |submission|
        @submissions.push submission
      end
    end
    render 'index'
  end
end
