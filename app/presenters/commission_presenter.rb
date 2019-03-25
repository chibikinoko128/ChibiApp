class CommissionPresenter < ModelPresenter
  delegate :bank_name, :fee_low, :fee_high, to: :object
  
  def id
    object.id
  end
  
  def pay_bank
    object.pay_bank
  end
  
  def bank_name
    object.bank_name
  end
  
  def fee_low
    object.fee_low
  end
  
  def fee_high
    object.fee_high
  end
end