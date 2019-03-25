class Customer::TopController < Customer::Base
  skip_before_action :authorize

  def index
    if current_customer
      @customer = Customer.find_by(id: current_customer.id)
      @name = @customer.family_name + @customer.given_name
      if Bank.find_by(customer_id: @customer.id)
        bank = Bank.find_by(customer_id: current_customer.id)
        if bank.bk_name.blank?
          render action: 'dashboard_a'
        elsif bank.office.blank?
          render action: 'dashboard_a'
        elsif bank.account.blank?
          render action: 'dashboard_a'
        else 
          render action: 'dashboard_b'
        end
      end 
    else
      render action: 'index'
    end
  end
end  
      