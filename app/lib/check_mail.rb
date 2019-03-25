class CheckMail
  def self.thanks_to_all
    time = Time.zone.now
    @month = time.month
    @next_month = @month + 1
    
    if @month == 1
      registers = Register.where(rg_1: "在籍")
    elsif @month == 2
      registers = Register.where(rg_2: "在籍")
    elsif @month == 3
      registers = Register.where(rg_3: "在籍")
    elsif @month == 4
      registers = Register.where(rg_4: "在籍")
    elsif @month == 5  
      registers = Register.where(rg_5: "在籍")
    elsif @month == 6
      registers = Register.where(rg_6: "在籍")
    elsif @month == 7
      registers = Register.where(rg_7: "在籍")
    elsif @month == 8
      registers = Register.where(rg_8: "在籍")
    elsif @month == 9
      registers = Register.where(rg_9: "在籍")
    elsif @month == 10
      registers = Register.where(rg_10: "在籍")
    elsif @month == 11
      registers = Register.where(rg_11: "在籍")
    else
      registers = Register.where(rg_12: "在籍")
    end
    
    check = []
    registers.each do |u|
      if @next_month <= 12
        if u["rg_#{@next_month}"] == "退会"
          check << u.customer_id
        end
      else
        if u.rg_1 == "退会"
          check << u.customer_id
        end
      end
    end
    
    check.each do |ｗ|
      user = Customer.find_by(id: ｗ)
      DirectMailer.d_mail(user).deliver_now  
    end
  end
end