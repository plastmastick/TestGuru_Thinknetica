# frozen_string_literal: true

module ApplicationHelper
  # Using for convert default flash types to bootstrap alerts types
  ALERTS_TYPES = {
    notice: :info,
    alert: :danger
  }.freeze

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
    return if messages.blank?

    messages.map do |m|
      content_tag :p, m.to_s,
                  class: "alert alert-#{ALERTS_TYPES[msg_type] || :danger} mt-3",
                  role: "alert"
    end
            .join.html_safe
  end
end
