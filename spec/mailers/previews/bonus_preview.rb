# Preview all emails at http://localhost:3000/rails/mailers/bonus
class BonusPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/bonus/bonus_get
  def bonus_get
    BonusMailer.bonus_get
  end

end
