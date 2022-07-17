# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to 'Github, TestGuru',
            "https://github.com/#{author}/#{repo}",
            target: :_blank,
            rel: 'nofollow, noopener'
  end

  def flash_msg
    flash.map do | key, msg |
      content_tag :p, msg, class: "flash #{key}"
    end.join.html_safe
  end
end
