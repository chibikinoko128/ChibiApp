class SeventeenPresenter < ModelPresenter
  delegate :year, :m_1, :m_2, :m_3, :c_1, :m_4, :m_5, :m_6, :c_2, :m_7, :m_8, :m_9, :c_3, :m_10, :m_11, :m_12, :c_4, to: :object
  
  def year
    object.year
  end
  
  def m_1
    object.m_1
  end
  
  def m_2
    object.m_2
  end
  
  def m_3
    object.m_3
  end
  
  def c_1
    object.c_1
  end
  
  def m_4
    object.m_4
  end
  
  def m_5
    object.m_5
  end
  
  def m_6
    object.m_6
  end
  
  def c_2
    object.c_2
  end
  
  def m_7
    object.m_7
  end
  
  def m_8
    object.m_8
  end
  
  def m_9
    object.m_9
  end
  
  def c_3
    object.c_3
  end
  
  def m_10
    object.m_10
  end
  
  def m_11
    object.m_11
  end
  
  def m_12
    object.m_12
  end
  
  def c_4
    object.c_4
  end
end
  
  