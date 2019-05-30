class SpTitleMailer < ApplicationMailer
  default from: '<wonder.gate128@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sp_member_mailer.sp_money.subject
  #
  def president(user)
    time = Time.zone.now
    @month = time.month
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
  
  def king(user)
    time = Time.zone.now
    @month = time.month
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
  
  def queen(user)
    time = Time.zone.now
    @month = time.month
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
  
  def phoenix(user)
    time = Time.zone.now
    @month = time.month
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
  
  def pegasus(user)
    time = Time.zone.now
    @month = time.month
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
end
