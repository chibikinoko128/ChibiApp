# Preview all emails at http://localhost:3000/rails/mailers/account
class AccountPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account/not_account
  def not_account
    AccountMailer.not_account
  end

end
