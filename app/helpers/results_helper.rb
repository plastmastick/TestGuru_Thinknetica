# frozen_string_literal: true

module ResultsHelper
  def result_info(result)
    if result.success_pass?
      t('helpers.results.result_info.test_passed')
    else
      t('helpers.results.result_info.test_failed')
    end
  end

  def pass_percentage_color(result)
    if result.success_pass?
      'success_pass'
    else
      'failed_pass'
    end
  end

  def timer_set(time)
    return if time.blank?

    time = time.round
    sec = time % 60
    min = time / 60

    "#{min}:#{sec}"
  end
end
