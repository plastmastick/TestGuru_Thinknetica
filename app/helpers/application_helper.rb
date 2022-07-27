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

  # flash types
  # default: :notice, :alert
  def render_messages(msg_type)
    messages = flash[msg_type]
    messages = [messages] if !messages.is_a?(Array) && !messages.nil?
    messages.map { |m| content_tag :p, m.to_s, class: "flash #{msg_type}" }
                 .join.html_safe if messages.present?
  end
end
