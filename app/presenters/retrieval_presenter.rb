class RetrievalPresenter < ModelPresenter
  delegate :year, :month, :item, to: :object
  
  def year
    object.year
  end
  
  def month
    object.month
  end
  
  def item
    object.item
  end
end