# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    # gem octokit
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_GIST_ACCESS_TOKEN'])
  end

  def create_gist
    @client.create_gist(gist_params)
    Responce.new(@client.last_response)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  Responce = Struct.new(:info) do
    def success?
      info.status == 201
    end

    def git_id
      info.data[:id]
    end
  end
end
