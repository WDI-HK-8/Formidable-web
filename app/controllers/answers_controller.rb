class AnswersController < ApplicationController

  def create
    @answer = Content.find(params[:content_id]).answers.create(answer_params)
  end

  private
  def answer_params
    params.require(:answer).permit(:values,:submission_id)
  end
end
