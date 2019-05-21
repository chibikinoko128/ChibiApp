class ApplicationMailer < ActionMailer::Base
  default from: 'ワンダーゲート運営局'<wonder.gate128@gmail.com>
  layout 'mailer'
end

ActionMailer::Base.register_observer(EmailLogObserver.new)