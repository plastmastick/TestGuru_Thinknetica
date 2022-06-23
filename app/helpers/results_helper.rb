# frozen_string_literal: true

module ResultsHelper
  def result_info(result)
    if result.success_pass?
      'Test passed.'
    else
      'Test failed.'
    end
  end

  def pass_percentage_color(result)
    if result.success_pass?
      'success_pass'
    else
      'failed_pass'
    end
  end
end
