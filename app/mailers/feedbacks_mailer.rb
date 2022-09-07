# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def user_feedback(feedback)
    @body = feedback.body
    @user = feedback.user
    @recipients = Admin.where.not(confirmed_at: nil)
    emails = @recipients.collect(&:email).join(",")

    mail to: emails, subject: t('feedbacks_mailer.user_feedback.subject', email: @user.email)
  end
end

