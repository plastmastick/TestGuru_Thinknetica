# frozen_string_literal: true

class ResultsController < ApplicationController
  before_action :set_result, only: %i[show update test_passage gist]

  def show; end

  def test_passage; end

  def update
    @result.accept!(params[:answer_ids])

    if @result.test_passage_completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to result_path(@result)
    else
      render :test_passage
    end
  end

  def gist
    gist_request = GistQuestionService.new(@result.current_question).call

    flash_options = if gist_request.success?
                      gist = Gist.create!({ git_id: gist_request.git_id,
                                            user: current_user,
                                            question: @result.current_question })
                      { notice: "#{t('.success')}: #{view_context.url(gist)}" }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
