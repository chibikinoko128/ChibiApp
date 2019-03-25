class StaffMonthPresenter < ModelPresenter
  delegate :year, :month, to: :object
  
  def retrieval_year
    object.retrieval_year
  end
  
  def retrieval_month
    object.retrieval_month
  end
end