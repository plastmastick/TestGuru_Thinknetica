# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  # GET /admin/gists
  def index
    @gists = Gist.all
  end
end
