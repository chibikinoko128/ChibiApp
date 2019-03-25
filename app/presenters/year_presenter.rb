class YearPresenter < ModelPresenter
  delegate :year, :month, :quarter, to: :object
  
  def year_check
    object.year_check
  end
end