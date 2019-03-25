# Preview all emails at http://localhost:3000/rails/mailers/direct_mailer
class DirectMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/direct_mailer/d_mail
  def d_mail
    user = Customer.find(3)
    DirectMailer.d_mail(user)
  end
end