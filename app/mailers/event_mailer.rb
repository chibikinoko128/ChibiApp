class EventMailer < ApplicationMailer
 default from: '<wonder.gate128@gmail.com>'
  
  def notification(user)
    @user = user
    mail to: user.email,
    subject: "WONDER GATEの開催イベントが追加されました。"
  end 
end
