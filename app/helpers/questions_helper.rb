# frozen_string_literal: true

module QuestionsHelper
  def question_header(test)
    case controller.action_name
    when 'edit'
      "Edit '#{test.title}' Question"
    when 'new'
      "Create New '#{test.title}' Question"
    when 'show'
      "'#{test.title}' Question"
    end
  end
end
