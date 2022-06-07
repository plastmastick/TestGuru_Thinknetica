# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create]
  before_action :find_question, only: %i[show destroy]

  def index
    text = "Questions: "
    Question.all.pluck(:body).each { |q| text += "\n #{q}" }

    render plain: text
  end

  def show
    # render plain: @question.inspect
  end

  def new; end

  def create
    new_question = Question.create!(test: @test, body: params[:question][:body])
    render plain: new_question.inspect
  end

  def destroy
    @question.destroy
  end

  private

  # def question_params
  #   params.require(:question).permit(:body)
  # end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
