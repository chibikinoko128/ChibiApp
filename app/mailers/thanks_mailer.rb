class ThanksMailer < ApplicationMailer
  default from: '<wonder.gate128@gmail.com>'
  def thank_you(user)
    @user = user
    mail to: user.email,
    subject: "会員登録ありがとうございました。"
  end
end
