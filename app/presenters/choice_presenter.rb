class ChoicePresenter < ModelPresenter
  delegate :detection, :remuneration, to: :object
  
  def detection
    object.detection
  end
  
  def remuneration
    object.remuneration
  end
end