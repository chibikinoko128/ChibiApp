class BankPresenter < ModelPresenter
  delegate :bk_name, :office, :account, :acc_name, :acc_name_kana, :bk_name_check, :office_check, :account_check, :web_registration, to: :object
  
  def bk_name
    object.bk_name
  end
  
  def office
    object.office
  end
  
  def account
    object.account
  end
  
  def acc_name
    object.acc_name
  end
  
  def acc_name_kana
    object.acc_name_kana
  end
  
  def bk_name_check
    object.bk_name_check
  end
  
  def office_check
    object.office_check
  end
  
  def account_check
    object.account_check
  end
  
  def web_registration
    object.web_registration
  end
end