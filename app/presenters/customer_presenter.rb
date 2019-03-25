class CustomerPresenter < ModelPresenter
  delegate :email, to: :object
  
  def email
    object.email
  end

  def full_name
    object.family_name + ' ' + object.given_name
  end

  def full_name_kana
    object.family_name_kana + ' ' + object.given_name_kana
  end
  
  def nickname
    object.nickname
  end
  
  def sponsor1
    object.sponsor1
  end

  def birthday
    return '' if object.birthday.blank?
    object.birthday.strftime('%Y/%m/%d')
  end

  def gender
    case object.gender
    when 'male'
      '男性'
    when 'female'
      '女性'
    else
      ''
    end
  end
  
  def id
    object.id
  end
  
  def member_type
    object.member_type
  end
  
  def lock
    object.lock
  end
  
  def bonus_lock
    object.bonus_lock
  end
  
  def special_lock
    object.special_lock
  end
  
  def personal_phones
    object.personal_phones.map(&:number)
  end
end
