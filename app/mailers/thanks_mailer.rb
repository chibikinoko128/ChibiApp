class ThanksMailer < ApplicationMailer
  default from: 'ワンダーゲート運営局'
  def thank_you(user)
    @user = user
    mail to: user.email,
    subject: "会員登録ありがとうございました。"
  end
end
