class StaffQuarterPresenter < ModelPresenter
  delegate :year, :quarter, to: :object
  
  def bonus_year
    object.bonus_year
  end
  
  def bonus_quarter
    object.bonus_quarter
  end
end