class CongratsMailer < ApplicationMailer
  default from: 'ワンダーゲート運営局'
  def membership_fee(user)
    time = Time.zone.now
    @month = time.month
    if @month <= 11
      @month1 = @month + 1
    else
      @month1 = 1
    end
    
    if @month == 1
      @last_month = 12
    else
      @last_month = @month - 1
    end
    
    if @month <= 11
      @next_month = @month + 1
    else
      @next_month = 1
    end
    
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
  
  def membership_fee1(user)
    time = Time.zone.now
    @month = time.month
    if @month <= 11
      @month1 = @month + 1
    else
      @month1 = 1
    end
    
    if @month == 1
      @last_month = 12
    else
      @last_month = @month - 1
    end
    
    if @month <= 11
      @next_month = @month + 1
    else
      @next_month = 1
    end
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
  
  def membership_fee2(user)
    time = Time.zone.now
    @month = time.month
    if @month <= 11
      @month1 = @month + 1
    else
      @month1 = 1
    end
    
    if @month == 1
      @last_month = 12
    else
      @last_month = @month - 1
    end
    
    if @month <= 11
      @next_month = @month + 1
    else
      @next_month = 1
    end
    @user = user
    mail to: user.email,
    subject: "おめでとうございます。"
  end
end
