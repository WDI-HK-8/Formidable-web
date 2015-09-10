class AnswersController < ApplicationController

  def create
    answers = params[:answers]
    key_list = answers.keys
    key_list.each do |content_id|
      Content.find(content_id).answers.create(submission_id: params["submission_id"], values: answers[content_id])
    end

    render json: {created: true}
  end
end
