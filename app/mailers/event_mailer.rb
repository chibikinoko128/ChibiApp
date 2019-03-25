class EventMailer < ApplicationMailer
 default from: 'ワンダーゲート運営局'
  
  def notification(user)
    @user = user
    mail to: user.email,
    subject: "WONDER GATEの開催イベントが追加されました。"
  end 
end
