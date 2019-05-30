class InformationMailer < ApplicationMailer
  default from: '<wonder.gate128@gmail.com>'
  
  def notification(user) 
    @user = user
    mail to: user.email,
    subject: "会員特典情報を追加しました。"
  end
end
