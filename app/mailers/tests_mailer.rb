# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, subject: t('tests_mailer.completed_test.subject')
  end
end
