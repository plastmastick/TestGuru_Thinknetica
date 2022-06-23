# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :set_result, only: %i[show update test_passage]

  def show; end

  def test_passage; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.test_passage_completed?
      redirect_to result_path(@result)
    else
      render :test_passage
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
