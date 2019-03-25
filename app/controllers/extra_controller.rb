class ExtraController < ApplicationController
  def sendmail
    user = Customer.find(51)
    ThanksMailer.thank_you(user).deliver_now
    render plain: 'メールが正しく送信できました。'
  end
end
