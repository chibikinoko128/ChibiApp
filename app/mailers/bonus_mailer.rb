class BonusMailer < ApplicationMailer
  default from: 'ワンダーゲート運営局'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bonus_mailer.bonus_get.subject
  #
  def bonus_get(user)
    time = Time.zone.now
    @month = time.month
    
    if @month == 4
      @quarter = 1
    elsif @month == 7
      @quarter = 2
    elsif @month == 10
      @quarter = 3
    else
      @quarter = 4
    end
    
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
  
  def bonus1_get(user)
    time = Time.zone.now
    @month = time.month
    
    if @month == 4
      @quarter = 1
    elsif @month == 7
      @quarter = 2
    elsif @month == 10
      @quarter = 3
    else
      @quarter = 4
    end
    
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
end
