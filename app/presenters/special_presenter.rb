class SpecialPresenter < ModelPresenter
  delegate :basic, :crystal, :silver, :gold, :platinum, :pegasus, :phoenix, :queen, :king, :president, to: :object

  def basic
    object.basic
  end
  
  def crystal
    object.crystal
  end
  
  def silver
    object.silver
  end
  
  def gold
    object.gold
  end
  
  def platinum
    object.platinum
  end
  
  def pegasus
    object.pegasus
  end
  
  def phoenix
    object.phoenix
  end
  
  def queen
    object.queen
  end
  
  def king
    object.king
  end
  
  def president
    object.president
  end
end