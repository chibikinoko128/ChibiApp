class DirectMailer < ApplicationMailer
  default from: 'ワンダーゲート運営局'
  def d_mail(user)
    time = Time.zone.now
    @day = time.day
    @user = user
    mail to: user.email,
      subject: "翌月のサイト利用料金の振込みはお済みですか？"
  end
end
