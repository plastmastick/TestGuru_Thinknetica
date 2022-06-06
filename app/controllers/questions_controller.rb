# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    text = "Questions: "
    Question.all.pluck(:body).each { |q| text += "\n #{q}" }

    render plain: text
  end

  def show
    render json: { questions: Question.find(params[:id]) }
  end

  def new; end

  def create
    # byebug
    question = Question.create!(test_id: params[:test_id], body: question_params[:body])
    render plain: question.inspect
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end
end
