class BankMailer < ApplicationMailer
  default from: 'ワンダーゲート運営局'
  
  def registration(user)
    time = Time.zone.now
    @day = time.day
    @user = user
    mail to: user.email,
    subject: "報酬受け取り用の口座登録はお済みでしょうか？"
  end 
end
