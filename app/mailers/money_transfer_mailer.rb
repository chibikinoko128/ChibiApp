class MoneyTransferMailer < ApplicationMailer
  default from: '<wonder.gate128@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.money_transfer_mailer.transfer.subject
  #
  def transfer(user)
    @check = Retrieval.find(1)
    @month = @check.month
    
    if @month == 1
      @month_2 = 11
    elsif @month == 2
      @month_2 = 12
    else
      @month_2 = @month - 2
    end
    
    @user = user
    mail to: user.email,
    subject: "報酬(キャッシュバック）を送金いたしました。"
  end
  
  def bonus_transfer(user)
    @check = Retrieval.find(1)
    @month = @check.month
    
    if @month == 1
      @quarter_1 = 4
    elsif @month == 4
      @quarter_1 = 1
    elsif @month == 7
      @quarter_1 = 2
    else
      if @month == 10
        @quarter_1 = 3
      end
    end
    
    @user = user
    mail to: user.email,
    subject: "報酬（ボーナス）を送金いたしました。"
  end
  
  def sp_transfer(user)
    @check = Retrieval.find(1)
    @month = @check.month
    
    if @month ==1
      @month_1 = 12
    else
      @month_1 = @month - 1
    end
    
    @user = user
    mail to: user.email,
    subject: "報酬（特別会員ボーナス）を送金いたしました。"
  end
end
