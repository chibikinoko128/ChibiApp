class MarginPresenter < ModelPresenter
  delegate :year, :month, to: :object
  
  def year
    object.year
  end
  
  def month
    object.month
  end
end