class SpMemberMailer < ApplicationMailer
  default from: '<wonder.gate128@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sp_member_mailer.sp_money.subject
  #
  def sp_money(user)
    time = Time.zone.now
    @month = time.month
    if @month < 12
      @next_month = @month + 1
    else
      @next_month = 1
    end
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
  
  def sp1_money(user)
    time = Time.zone.now
    @month = time.month
    if @month < 12
      @next_month = @month + 1
    else
      @next_month = 1
    end
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
end
