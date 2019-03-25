class User
  def self.owner_only
    time = Time.zone.now
    month = time.month
    
    reg = Register.find(2) #長谷部　和広 
    reg.rg_1 = "在籍"
    reg.rg_2 = "在籍"
    reg.rg_3 = "在籍"
    reg.rg_4 = "在籍"
    reg.rg_5 = "在籍"
    reg.rg_6 = "在籍"    
    reg.rg_7 = "在籍"
    reg.rg_8 = "在籍" 
    reg.rg_9 = "在籍" 
    reg.rg_10 = "在籍"
    reg.rg_11 = "在籍"
    reg.rg_12 = "在籍"
    reg.save
    
    reg1 = Register.find(3) #長谷部　陽 
    reg1.rg_1 = "在籍"
    reg1.rg_2 = "在籍"
    reg1.rg_3 = "在籍"
    reg1.rg_4 = "在籍"
    reg1.rg_5 = "在籍"
    reg1.rg_6 = "在籍"    
    reg1.rg_7 = "在籍"
    reg1.rg_8 = "在籍" 
    reg1.rg_9 = "在籍"  
    reg1.rg_10 = "在籍"
    reg1.rg_11 = "在籍"
    reg1.rg_12 = "在籍"
    reg1.save
      
    customer = Customer.where("id > 3").pluck(:id)
    if customer.present?
      customer.each do |e|
        register = Register.find_by(customer_id: e)
      
        if month == 1
          last_month = 12
        else
          last_month = month - 1
        end
    
        if month <= 11
          month1 = month + 1
        else
          month1 = 1
        end
    
        score = Score.find_by(customer_id: e)
        score1 = score["sc_#{last_month}"]
        if score1 >= 1700
          register["rg_#{month1}"] = "在籍"
          register.save
        end
      
        if month == 1
          register.rg_7 = "退会"
          register.rg_8 = "退会"
          register.rg_9 = "退会"
        elsif month == 2
          register.rg_8 = "退会"
          register.rg_9 = "退会"
          register.rg_10 = "退会"
        elsif month == 3
          register.rg_9 = "退会"
          register.rg_10 = "退会"
          register.rg_11 = "退会"
        elsif month == 4
          register.rg_10 = "退会"
          register.rg_11 = "退会"
          register.rg_12 = "退会"
        elsif month == 5
          register.rg_11 = "退会"
          register.rg_12 = "退会"
          register.rg_1 = "退会"
        elsif month == 6
          register.rg_12 = "退会"
          register.rg_1 = "退会"
          register.rg_2 = "退会"
        elsif month == 7
          register.rg_1 = "退会"
          register.rg_2 = "退会"
          register.rg_3 = "退会"
        elsif month == 8
          register.rg_2 = "退会"
          register.rg_3 = "退会"
          register.rg_4 = "退会"
        elsif month == 9
          register.rg_3 = "退会"
          register.rg_4 = "退会"
          register.rg_5 = "退会"
        elsif month == 10
          register.rg_4 = "退会"
          register.rg_5 = "退会"
          register.rg_6 = "退会"
        elsif month == 11
          register.rg_5 = "退会"
          register.rg_6 = "退会"
          register.rg_7 = "退会"
        else 
          register.rg_6 = "退会"
          register.rg_7 = "退会"
          register.rg_8 = "退会"
        end
        register.save
      end
    end
  end
end
      