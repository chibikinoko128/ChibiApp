class Customer::SpecialsController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    special = Special.find_by(customer_id: current_customer.id)
    
    if special.president >= 1
      @special = "プレジデント"
    elsif special.king >= 1
      @special = "キング"
    elsif special.queen >= 1
      @special = "クイーン"
    elsif special.phoenix >= 1
      @special = "フェニックス"
    elsif special.pegasus >= 1
      @special = "ペガサス"
    else
      @special = "特典ボーナス資格はありません。"
    end  
  end
end