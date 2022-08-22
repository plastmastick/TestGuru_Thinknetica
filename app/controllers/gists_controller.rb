# frozen_string_literal: true

class GistsController < ApplicationController
  # POST /gists
  def create
    set_result
    gist_request = GistQuestionService.new(@result.current_question).create_gist

    flash_options = if gist_request.success?
                      gist = Gist.create!({ git_id: gist_request.git_id, user: current_user,
                                            question: @result.current_question })
                      { notice: t('.success', gist_url: view_context.url(gist)) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:result_id])
  end
end
