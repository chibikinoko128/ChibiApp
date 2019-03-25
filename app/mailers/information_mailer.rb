class InformationMailer < ApplicationMailer
  default from: 'ワンダーゲート運営局'
  
  def notification(user) 
    @user = user
    mail to: user.email,
    subject: "会員特典情報を追加しました。"
  end
end
