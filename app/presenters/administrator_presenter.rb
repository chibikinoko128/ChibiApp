class AdministratorPresenter < ModelPresenter
  delegate :suspended?, to: :object
  
  def email
    object.email
  end
  
  def full_name
    object.family_name + ' ' + object.given_name
  end

  def full_name_kana
    object.family_name_kana + ' ' + object.given_name_kana
  end
  
  # 社員の停止フラグのon/offを表現する記号を返す。
  # on: BALLOT BOX WITH CHECK (U+2611)
  # off: BALLOT BOX (U+2610)
  def suspended_mark
    suspended? ? raw('&#x2611;') : raw('&#x2610;')
  end
end