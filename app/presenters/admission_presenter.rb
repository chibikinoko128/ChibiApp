class AdmissionPresenter < ModelPresenter
  delegate :entris_year, :entries_month, :entries_day, to: :object
  
  def entries_year
    object.year
  end
  
  def entries_month
    object.month
  end
  
  def entries_day
    object.day
  end
end