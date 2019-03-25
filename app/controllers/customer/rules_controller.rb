class Customer::RulesController < Customer::Base
  def agreement
    render action: 'agreement'
  end
  
  def how_to_use
    render action: 'how_to_use'
  end
  
  def maintenance
    render action: 'maintenance'
  end
  
  def unsubscribe
    render action: 'unsubscribe'
  end
  
  def privilege
    render action: 'privilege'
  end
  
  def lapse
    render action: 'lapse'
  end
  
  def cache
    render action: 'cache'
  end
  
  def bonus
    render action: 'bonus'
  end
  
  def privilege_bonus
    render action: 'privilege_bonus'
  end
  
  def question
    render action: 'question'
  end
  
  def individual
    render action: 'individual'
  end
  
  def personal
    render action: 'personal'
  end
  
  def mouse
    render action: 'mouse'
  end
  
  def account
    @customer = Customer.find_by(id: current_customer.id)
  end
  
  def explain
    render action: 'explain'
  end
end

