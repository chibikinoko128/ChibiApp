class CustomerYearPresenter < ModelPresenter
  delegate :year_check, :month, :quarter, to: :object
  
  def year_check
    object.year_check
  end
end