class BonusTitleMailer < ApplicationMailer
  default from: '<wonder.gate128@gmail.com>'
  
  def normal(user)
    @user = user
    mail to: user.email,
    subject: "ボーナスを獲得しました。"
  end
  
  def basic(user)
    @user = user
    mail to: user.email,
    subject: "ボーナスタイトル(ベーシック）を獲得しました。"
  end
  
  def crystal(user)
    @user = user
    mail to: user.email,
    subject: "ボーナスタイトル（クリスタル）を獲得しました。"
  end
  
  def silver(user)
    @user = user
    mail to: user.email,
    subject: "ボーナスタイトル（シルバー）を獲得しました。"
  end
  
  def gold(user)
    @user = user
    mail to: user.email,
    subject: "ボーナスタイトル（ゴールド）を獲得しました。"
  end
  
  def platinum(user)
    @user = user
    mail to: user.email,
    subject: "ボーナスタイトル（プラチナ）を獲得しました。"
  end
end
