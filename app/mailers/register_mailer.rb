class RegisterMailer < ApplicationMailer
  default from: 'ワンダーゲート運営局'<wonder.gate128@gmail.com>
  
  def payment(user)
    @time = Time.zone.now
    @month = @time.month
    if @month == 1
      @last_month = 12
      @next_month = 2
    elsif @month == 12
      @last_month = 11
      @next_month = 1
    else
      @last_mont = @time.month - 1
      @next_month = @time.month + 1
    end
    
    @user = user
    mail to: user.email,
    subject: "利用料金のお振り込みありがとうございます。"
  end
  
  def next_payment(user)
    @time = Time.zone.now
    @month = @time.month
    if @month == 1
      @last_month = 12
      @next_month = 2
    elsif @month == 12
      @last_month = 11
      @next_month = 1
    else
      @last_mont = @time.month - 1
      @next_month = @time.month + 1
    end
    
    @user = user
    mail to: user.email,
    subject: "利用料金のお振り込みありがとうございます。"
  end
  
  def new_payment(user)
    @time = Time.zone.now
    @month = @time.month
    if @month == 1
      @last_month = 12
      @next_month = 2
    elsif @month == 12
      @last_month = 11
      @next_month = 1
    else
      @last_mont = @time.month - 1
      @next_month = @time.month + 1
    end
    
    @user = user
    mail to: user.email,
    subject: "利用料金のお振り込みありがとうございます。"
  end
end
