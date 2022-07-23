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

  def render_flash
    rendered = []
    flash.each do |type, messages|
      messages = [messages] unless messages.is_a?(Array)
      messages.each do |m|
        rendered << render(partial: 'shared/flash', locals: { type: type, message: m }) if m.present?
      end
    end
    rendered.join.html_safe
  end
end
