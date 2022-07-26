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

  protected

  def render_messages(msg_type)
    flash.each { |k, v| add_message(k, v) if k.to_sym == msg_type } if flash
    current_messages[msg_type].map { |m| content_tag :p, m.to_s, class: "flash #{msg_type}" }
                 .join.html_safe if current_messages[msg_type].present?
  end
end
