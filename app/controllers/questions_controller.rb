# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    text = "Questions: "
    Question.all.pluck(:body).each { |q| text += "\n #{q}" }

    render plain: text
  end

  def show; end

  def new; end

  def create
    new_question = Question.create!(test: @test, body: params[:question][:body])
    redirect_to question_path(new_question) if new_question.persisted?
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
