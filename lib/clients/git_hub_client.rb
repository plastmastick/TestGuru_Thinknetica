class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'.freeze
  ACCESS_TOKEN = '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'.freeze

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Accept'] = 'application/vnd.github+json'
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
