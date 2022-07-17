# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <info@testguru.com>}
  layout 'mailer'
end
