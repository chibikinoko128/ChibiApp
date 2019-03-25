class Customer::PrisonersController < Customer::Base
  def arrest
    render action: 'arrest'
  end
  
  def lawyer
    render action: 'lawyer'
  end
  
  def scene
    render action: 'scene'
  end
  
  def investigation
    render action: 'investigation'
  end
  
  def prosecutor
    render action: 'prosecutor'
  end
  
  def indictment
    render action: 'indictment'
  end
  
  def jail
    render action: 'jail'
  end
  
  def hand_over
    render action: 'hand_over'
  end
  
  def judgment
    render action: 'judgment'
  end
  
  def sentence
    render action: 'sentence'
  end
  
  def complaint
    render action: 'complaint'
  end
  
  def prison
    render action: 'prison'
  end
  
  def examination
    render action: 'examination'
  end
  
  def prison_term
    render action: 'prison_term'
  end
  
  def education
    render action: 'education'
  end
  
  def factory
    render action: 'factory'
  end
  
  def release
    render action: 'release'
  end
  
  def officer
    render action: 'officer'
  end
  
  def maturity
    render action: 'maturity'
  end
  
  def top
    render action: 'top'
  end
  
  def schedule
    render action: 'schedule'
  end
  
  def caution
    render sction: 'caution'
  end
end
