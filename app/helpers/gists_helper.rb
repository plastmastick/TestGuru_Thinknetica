# frozen_string_literal: true

module GistsHelper
  def url(gist)
    link_to gist.git_id,
            "https://gist.github.com/#{gist.git_id}",
            target: '_blank',
            rel: 'nofollow, noopener',
            class: "text-decoration-none"
  end
end
