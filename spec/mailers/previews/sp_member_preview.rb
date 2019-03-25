# Preview all emails at http://localhost:3000/rails/mailers/sp_member
class SpMemberPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sp_member/sp_money
  def sp_money
    SpMemberMailer.sp_money
  end

end
