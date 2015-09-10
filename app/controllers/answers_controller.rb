class AnswersController < ApplicationController

  def create
    answers = params[:answers]
    answers.keys.each do |content_id|
      Content.find(content_id).answers.create(submission_id: answers[:content_id][:submission_id], values: answers[:content_id][:values])
    end

    render json: 'done'
  end

  # private
  # def answer_params
  #   params.require(:answer).permit({:values => []},:submission_id)
  # end
end
