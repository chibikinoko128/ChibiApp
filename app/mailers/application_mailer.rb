class ApplicationMailer < ActionMailer::Base
  default from: 'wonder.gate128@gmail.com'
  layout 'mailer'
end

ActionMailer::Base.register_observer(EmailLogObserver.new)