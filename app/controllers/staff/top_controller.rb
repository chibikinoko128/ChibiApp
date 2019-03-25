class Staff::TopController < Staff::Base
  skip_before_action :authorize
  
  def index
    time = Time.zone.now
    @year = time.year
    @month = time.month
    unsub_register
    @customer_ids = (Customer.ids - @unsub).count
    
    if current_staff_member
      render action: 'dashboard'
    else
      render action: 'index'
    end
  end
  
  def unsub_register
    if @month == 1
      @unsub = Register.where(rg_1: "退会").pluck(:customer_id) 
    elsif @month == 2
      @unsub = Register.where(rg_2: "退会").pluck(:customer_id)
    elsif @month == 3
      @unsub = Register.where(rg_3: "退会").pluck(:customer_id)
    elsif @month == 4
      @unsub = Register.where(rg_4: "退会").pluck(:customer_id)
    elsif @month == 5
      @unsub = Register.where(rg_5: "退会").pluck(:customer_id)
    elsif @month == 6
      @unsub = Register.where(rg_6: "退会").pluck(:customer_id)
    elsif @month == 7
      @unsub = Register.where(rg_7: "退会").pluck(:customer_id)
    elsif @month == 8
      @unsub = Register.where(rg_8: "退会").pluck(:customer_id)
    elsif @month == 9
      @unsub = Register.where(rg_9: "退会").pluck(:customer_id)
    elsif @month == 10
      @unsub = Register.where(rg_10: "退会").pluck(:customer_id)
    elsif @month == 11
      @unsub = Register.where(rg_11: "退会").pluck(:customer_id)
    else
      @unsub = Register.where(rg_12: "退会").pluck(:customer_id)
    end
  end
end
