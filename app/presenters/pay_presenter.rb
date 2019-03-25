class PayPresenter < ModelPresenter
  delegate :year, :month, :quarter, to: :object
  
  def year
    object.year
  end
  
  def month
    object.month
  end
  
  def quarter
    object.quarter
  end
end