class BankMailer < ApplicationMailer
  default from: '<wonder.gate128@gmail.com>'
  
  def registration(user)
    time = Time.zone.now
    @day = time.day
    @user = user
    mail to: user.email,
    subject: "報酬受け取り用の口座登録はお済みでしょうか？"
  end 
end
