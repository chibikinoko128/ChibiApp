class ThanksMailerPreview < ActionMailer::Preview
  def thank_you
    user = Customer.find(3)
    ThanksMailer.thank_you(user)
  end
end
    