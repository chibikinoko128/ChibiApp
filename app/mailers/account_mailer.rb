class AccountMailer < ApplicationMailer
  default from: 'ワンダーゲート運営局'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.not_account.subject
  #
  def not_account(user)
    @user = user
    mail to: user.email,
    subject: "報酬受け取り用の口座に誤りがあるようです。"
  end
end
