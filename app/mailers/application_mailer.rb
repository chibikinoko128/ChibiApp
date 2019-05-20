class ApplicationMailer < ActionMailer::Base
  default from: 'ワンダーゲート運営局'
  layout 'mailer'
end

ActionMailer::Base.register_observer(EmailLogObserver.new)