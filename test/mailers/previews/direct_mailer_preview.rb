class DirectMailerPreview < ActionMailer::Preview
  def d_mail
    user = Customer.find(3)
    DirectMailer.d_mail(user)
  end
end