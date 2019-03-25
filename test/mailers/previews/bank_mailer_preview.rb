class BankMailerPreview < ActionMailer::Preview
  def registration
    user = Customer.find(2)
    BankMailer.registration(user)
  end
end