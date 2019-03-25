class CongratsMailerPreview < ActionMailer::Preview
  def membership_fee1
    user = Customer.find(3)
    CongratsMailer.membership_fee1(user)
  end
end
    