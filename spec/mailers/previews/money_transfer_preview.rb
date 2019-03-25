# Preview all emails at http://localhost:3000/rails/mailers/money_transfer
class MoneyTransferPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/money_transfer/transfer
  def transfer
    MoneyTransferMailer.transfer
  end

end
