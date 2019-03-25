class Customer::RegistersController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    perfo = Register.where(customer_id: current_customer.id)
    if perfo.empty?
      regist = @customer.build_register
      regist.save
    end
    @register = Register.find_by(Customer_id: current_customer.id)
    
    #time = Time.zone.now
    #@month = time.month
    eagle = @customer.nickname
    @ccc = Customer.where(sponsor1:eagle).pluck(:id)
    
    #if @month <= 10
      #@month1 = @month + 2
    #elsif @month == 11
      #@month1 = 1
    #else
      #@month1 = 2
    #end
    
    #score = Score.find_by(customer_id: current_customer.id)
    #score1 = score["sc_#{@month}"]
    #if score1 >= 1000
      #reg = Register.find_by(customer_id: current_customer.id)
      #reg["rg_#{@month1}"] = "在籍"
      #reg.save
    #end
  end
  
  def check
    @customer = Customer.find_by(id: current_customer.id)
    @register = Register.find_by(Customer_id: current_customer.id)
  end
end

