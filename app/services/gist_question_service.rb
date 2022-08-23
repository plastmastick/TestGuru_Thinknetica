# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    # gem octokit
    @client = client
  end

  def create_gist
    @client.create_gist(gist_params)
    Responce.new(@client.last_response)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_GIST_ACCESS_TOKEN'))
  end

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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
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
