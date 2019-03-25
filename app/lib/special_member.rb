class SpecialMember
  def self.pt_special
    time = Time.zone.now
    @year = time.year
    @month = time.month
    
    if @month == 1
      @unsub_special = Register.where(rg_1: "退会").pluck(:customer_id)
    elsif @month == 2
      @unsub_special = Register.where(rg_2: "退会").pluck(:customer_id)
    elsif @month == 3
      @unsub_special = Register.where(rg_3: "退会").pluck(:customer_id)
    elsif @month == 4
      @unsub_special = Register.where(rg_4: "退会").pluck(:customer_id)
    elsif @month == 5
      @unsub_special = Register.where(rg_5: "退会").pluck(:customer_id)
    elsif @month == 6
      @unsub_special = Register.where(rg_6: "退会").pluck(:customer_id)
    elsif @month == 7
      @unsub_special = Register.where(rg_7: "退会").pluck(:customer_id)
    elsif @month == 8
      @unsub_special = Register.where(rg_8: "退会").pluck(:customer_id)
    elsif @month == 9
      @unsub_special = Register.where(rg_9: "退会").pluck(:customer_id)
    elsif @month == 10
      @unsub_special = Register.where(rg_10: "退会").pluck(:customer_id)
    elsif @month == 11
      @unsub_special = Register.where(rg_11: "退会").pluck(:customer_id)
    else
      @unsub_special = Register.where(rg_12: "退会").pluck(:customer_id)
    end
    
    customer = Customer.where(member_type: "特別会員").where.not(customer_id: [@unsub_special]).pluck(:id)
    customer.each do |p|
      cus = Customer.find_by(id: p)
      @nickname1 = cus.nickname
      if @year == 2018
        @year_point = Eighteen.find_by(customer_id: cus.id)
        special_sub
      elsif @year == 2019
        @year_point = Nineteen.find_by(customer_id: customer.id)
        special_sub
      elsif @year == 2020
        @year_point = Twentie.find_by(customer_id: customer.id)
        special_sub
      elsif @year == 2021
        @year_point = One.find_by(customer_id: customer.id)
        special_sub
      elsif @year == 2022
        @year_point = TwentyTwo.find_by(customer_id: customer.id)
        special_sub
      elsif @year == 2023
        @year_point = TwentyThree.find_by(customer_id: customer.id)
        special_sub
      elsif @year == 2024
        @year_point = TwentyFour.find_by(customer_id: customer.id)
        special_sub
      elsif @year == 2025
        @year_point = TwentyFive.find_by(customer_id: customer.id)
        special_sub
      elsif @year == 2026
        @year_point = TwentySix.find_by(customer_id: customer.id)
        special_sub
      else
        if @year == 2027
          @year_point = TwentySeven.find_by(customer_id: customer.id)
          special_sub
        end
      end
    end 
  end
  
  def self.special_sub
    if @month == 1
      @unsub = Register.where(rg_1: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_1 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_1 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_1 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_1 <= 700
      elsif (700 < @year_point.pt_special_1 && @year_point.pt_special_1 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_1 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @month == 2
      @unsub = Register.where(rg_2: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_2 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_2 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_2 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_2 <= 700
      elsif (700 < @year_point.pt_special_2 && @year_point.pt_special_2 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_2 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @month == 3
      @unsub = Register.where(rg_3: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_3 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_3 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_3 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_3 <= 700
      elsif (700 < @year_point.pt_special_3 && @year_point.pt_special_3 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_3 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @month == 4
      @unsub = Register.where(rg_4: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_4 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_4 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_4 = @pt_special - 1000
        end
      end
      @year_point.save
      
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_4 <= 700
      elsif (700 < @year_point.pt_special_4 && @year_point.pt_special_4 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_4 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @month == 5
      @unsub = Register.where(rg_5: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_5 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_5 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_5 = @pt_special - 1000
        end
      end
      @year_point.save
    
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_5 <= 700
      elsif (700 < @year_point.pt_special_5 && @year_point.pt_special_5 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_5 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @month == 6
      @unsub = Register.where(rg_6: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_6 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_6 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_6 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_6 <= 700
      elsif (700 < @year_point.pt_special_6 && @year_point.pt_special_6 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_6 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @month == 7
      @unsub = Register.where(rg_7: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_7 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_7 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_7 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_7 <= 700
      elsif (700 < @year_point.pt_special_7 && @year_point.pt_special_7 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_7 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @month == 8
      @unsub = Register.where(rg_8: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_8 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_8 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_8 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_8 <= 700
      elsif (700 < @year_point.pt_special_8 && @year_point.pt_special_8 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_8 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @month == 9
      @unsub = Register.where(rg_9: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_9 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_9 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_9 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_9 <= 700
      elsif (700 < @year_point.pt_special_9 && @year_point.pt_special_9 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_9 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @month == 10
      @unsub = Register.where(rg_10: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_10 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_10 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_10 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_10 <= 700
      elsif (700 < @year_point.pt_special_10 && @year_point.pt_special_10 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_10 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    elsif @monyh == 11
      @unsub = Register.where(rg_11: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_11 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_11 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_11 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_11 <= 700
      elsif (700 < @year_point.pt_special_11 && @year_point.pt_special_11 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_11 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    else
      @unsub = Register.where(rg_12: "退会").pluck(:customer_id)
      special_month
      if @pt_special <= 700
        @year_point.pt_special_12 = 0
      elsif (700 < @pt_special && @pt_special <= 29999)
        @year_point.pt_special_12 = @pt_special - 700
      else
        if @pt_special >= 30000
          @year_point.pt_special_12 = @pt_special - 1000
        end
      end
      @year_point.save
          
      k = @year_point.customer_id
      user = Customer.find_by(id: k)    
      if @year_point.pt_special_12 <= 700
      elsif (700 < @year_point.pt_special_12 && @year_point.pt_special_12 <= 29999)
        SpMemberMailer.sp_money(user).deliver_now
      else
        if @year_point.pt_special_12 >= 30000 
          SpMemberMailer.sp1_money(user).deliver_now
        end
      end
    end
  end
  
  def self.special_month
    m1 = Sponsor.where(sponsor1: @nickname1).where.not(id: [@unsub]).count  #1段目
    
    m2 = Sponsor.where(sponsor2: @nickname1).where.not(id: [@unsub]).count  #2段目
    
    m3 = Sponsor.where(sponsor3: @nickname1).where.not(id: [@unsub]).count  #3段目
    
    m4 = Sponsor.where(sponsor4: @nickname1).where.not(id: [@unsub]).count  #4段目
    
    m5 = Sponsor.where(sponsor5: @nickname1).where.not(id: [@unsub]).count  #5段目
    
    m6 = Sponsor.where(sponsor6: @nickname1).where.not(id: [@unsub]).count  #6段目
    
    m7 = Sponsor.where(sponsor7: @nickname1).where.not(id: [@unsub]).count  #7段目
    
    @pt_special = (m1 + m2 + m3 + m4 + m5 + m6 + m7) * 30
  end
end