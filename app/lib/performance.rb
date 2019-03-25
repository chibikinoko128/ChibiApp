class Performance
  def self.year_performance
    time = Time.zone.now
    @year = time.year
    @month = time.month
    @day = time.day
   
    if @month == 1
      @last_month = 12
      @next_month = @month + 1
      @last_year = @year - 1
    elsif @month == 12
      @last_month = 11
      @next_month = 1
      @last_year = @year
    else
      @last_month = @month - 1
      @next_month = @month + 1
      @last_year = @year
    end
    
    if @month == 1
      @unsub = Register.where(rg_1: "退会").pluck(:customer_id)
      @sub = Register.where(rg_1: "在籍").pluck(:customer_id)
    elsif @month == 2
      @unsub = Register.where(rg_2: "退会").pluck(:customer_id)
      @sub = Register.where(rg_2: "在籍").pluck(:customer_id)
    elsif @month == 3
      @unsub = Register.where(rg_3: "退会").pluck(:customer_id)
      @sub = Register.where(rg_3: "在籍").pluck(:customer_id)
    elsif @month == 4
      @unsub = Register.where(rg_4: "退会").pluck(:customer_id)
      @sub = Register.where(rg_4: "在籍").pluck(:customer_id)
    elsif @month == 5
      @unsub = Register.where(rg_5: "退会").pluck(:customer_id)
      @sub = Register.where(rg_5: "在籍").pluck(:customer_id)
    elsif @month == 6
      @unsub = Register.where(rg_6: "退会").pluck(:customer_id)
      @sub = Register.where(rg_6: "在籍").pluck(:customer_id)
    elsif @month == 7
      @unsub = Register.where(rg_7: "退会").pluck(:customer_id)
      @sub = Register.where(rg_7: "在籍").pluck(:customer_id)
    elsif @month == 8
      @unsub = Register.where(rg_8: "退会").pluck(:customer_id)
      @sub = Register.where(rg_8: "在籍").pluck(:customer_id)
    elsif @month == 9
      @unsub = Register.where(rg_9: "退会").pluck(:customer_id)
      @sub = Register.where(rg_9: "在籍").pluck(:customer_id)
    elsif @month == 10
      @unsub = Register.where(rg_10: "退会").pluck(:customer_id)
      @sub = Register.where(rg_10: "在籍").pluck(:customer_id)
    elsif @month == 11
      @unsub = Register.where(rg_11: "退会").pluck(:customer_id)
      @sub = Register.where(rg_11: "在籍").pluck(:customer_id)
    else
      @unsub = Register.where(rg_12: "退会").pluck(:customer_id)
      @sub = Register.where(rg_12: "在籍").pluck(:customer_id)
    end
    
    @sub.each do |i|
      @sub_i = i
      if @year == 2018
        @score = Score.find_by(customer_id: i)
        @year_point = Eighteen.find_by(customer_id: i)
        month_money
        bonus_right
        bonus_money
        bonus_sub
        
      elsif @year == 2019
        @score = Score.find_by(customer_id: i)
        @year_point = Nineteen.find_by(customer_id: i)
        @last_year_point = Eighteen.find_by(customer_id: i)
        month_money
        bonus_right
        bonus_money
        bonus_sub
        
      elsif @year == 2020
        @score = Score.find_by(customer_id: i)
        @year_point = Twentie.find_by(customer_id: i)
        @last_year_point = Nineteen.find_by(customer_id: i)
        month_money
        bonus_right
        bonus_money
        bonus_sub
        
      elsif @year == 2021
        @score = Score.find_by(customer_id: i)
        @year_point = One.find_by(customer_id: i)
        @last_year_point = Twentie.find_by(customer_id: i)
        month_money
        bonus_right
        bonue_money
        bonus_sub
      
      elsif @year == 2022
        @score = Score.find_by(customer_id: i)
        @year_point = TwentyTwo.find_by(customer_id: i)
        @last_year_point = One.find_by(customer_id: i)
        month_money
        bonus_right
        bonue_money
        bonus_sub

      elsif @year == 2023
        @score = Score.find_by(customer_id: i)
        @year_point = TwentyThree.find_by(customer_id: i)
        @last_year_point = TwentyTwo.find_by(customer_id: i)
        month_money
        bonus_right
        bonue_money
        bonus_sub
        
      elsif @year == 2024
        @score = Score.find_by(customer_id: i)
        @year_point = TwentyFour.find_by(customer_id: i)
        @last_year_point = TwentyThree.find_by(customer_id: i)
        month_money
        bonus_right
        bonue_money
        bonus_sub
        
      elsif @year == 2025
        @score = Score.find_by(customer_id: i)
        @year_point = TwentyFive.find_by(customer_id: i)
        @last_year_point = TwentyFour.find_by(customer_id: i)
        month_money
        bonus_right
        bonue_money
        bonus_sub
        
      elsif @year == 2026
        @score = Score.find_by(customer_id: i)
        @year_point = TwentySix.find_by(customer_id: i)
        @last_year_point = TwentyFive.find_by(customer_id: i)
        month_money
        bonus_right
        bonue_money
        bonus_sub
        
      else
        if @year == 2027
          @score = Score.find_by(customer_id: i)
          @year_point = TwentySeven.find_by(customer_id: i)
          @last_year_point = TwentySix.find_by(customer_id: i)
          month_money
          bonus_right
          bonue_money
          bonus_sub
        end
      end
    end
  end
  
  def self.bonus_money
    member = Member.find_by(customer_id: @sub_i)
    user = Customer.find_by(id: @sub_i)
    if @month == 4
      member1 = member.mbc_1
      if @q_value < 3
        if @score.scc_1 < 5000
          @bonus = 0
        elsif (5000 < @score.scc_1 && @score.scc_1 <= 19999)
          @bonus = member1 * 15
          if @day == 6
            BonusTitleMailer.normal(user).deliver_now
          end
        else
          if @score.scc_1 >= 20000
            @bonus = member1 * 13
            if @day == 6
              BonusTitleMailer.basic(user).deliver_now
            end
          end
        end
      elsif (3 <= @q_value && @q_value <= 4)
        @bonus = member1 * 12
        if @day == 6
          BonusTitleMailer.crystal(user).deliver_now
        end
      elsif (5 <= @q_value && @q_value <= 6)
        @bonus = member1 * 11
        if @day == 6
          BonusTitleMailer.silver(user).deliver_now
        end
      elsif (7 <= @q_value && @q_value <= 8)
        @bonus = member1 * 10
        if @day == 6
          BonusTitleMailer.gold(user).deliver_now
        end
      else
        if @q_value >= 9
          @bonus = member1 * 9
          if @day == 6
            BonusTitleMailer.platinum(user).deliver_now
          end
        end
      end
      @year_point.c_1 = @bonus
      @year_point.save
    elsif @month == 7
      member2 = member.mbc_2
      if @q_value < 3
        if @score.scc_2 < 5000
          @bonus = 0
        elsif (5000 < @score.scc_2 && @score.scc_2 <= 19999)
          @bonus = member2 * 15
          if @day == 6
            BonusTitleMailer.normal(user).deliver_now
          end
        else
          if @score.scc_2 >= 20000
            @bonus = member2 * 13
            if @day == 6
              BonusTitleMailer.basic(user).deliver_now
            end
          end
        end
      elsif (3 <= @q_value && @q_value <= 4)
        @bonus = member2 * 12
        if @day == 6
          BonusTitleMailer.crystal(user).deliver_now
        end
      elsif (5 <= @q_value && @q_value <= 6)
        @bonus = member2 * 11
        if @day == 6
          BonusTitleMailer.silver(user).deliver_now
        end
      elsif (7 <= @q_value && @q_value <= 8)
        @bonus = member2 * 10
        if @day == 6
          BonusTitleMailer.gold(user).deliver_now
        end
      else
        if @q_value >= 9
          @bonus = member2 * 9
          if @day == 6
            BonusTitleMailer.platinum(user).deliver_now
          end
        end
      end
      @year_point.c_2 = @bonus
      @year_point.save
    elsif @month == 10
      member3 = member.mbc_3
      if @q_value < 3
        if @score.scc_3 < 5000
          @bonus = 0
        elsif (5000 < @score.scc_3 && @score.scc_3 <= 19999)
          @bonus = member3 * 15
          if @day == 6
            BonusTitleMailer.normal(user).deliver_now
          end
        else
          if @score.scc_3 >= 20000
            @bonus = member3 * 13
            if @day == 6
              BonusTitleMailer.basic(user).deliver_now
            end
          end
        end
      elsif (3 <= @q_value && @q_value <= 4)
        @bonus = member3 * 12
        if @day == 6
          BonusTitleMailer.crystal(user).deliver_now
        end
      elsif (5 <= @q_value && @q_value <= 6)
        @bonus = member3 * 11
        if @day == 6
          BonusTitleMailer.silver(user).deliver_now
        end
      elsif (7 <= @q_value && @q_value <= 8)
        @bonus = member3 * 10
        if @day == 6
          BonusTitleMailer.gold(user).deliver_now
        end
      else
        if @q_value >= 9
          @bonus = member3 * 9
          if @day == 6
            BonusTitleMailer.platinum(user).deliver_now
          end
        end
      end
      @year_point.c_3 = @bonus
      @year_point.save
    else
      if @month == 1
        member4 = member.mbc_4
        if @q_value < 3
          if @score.scc_4 < 5000
            @bonus = 0
          elsif (5000 < @score.scc_4 && @score.scc_4 <= 19999)
            @bonus = member4 * 15
            if @day == 6
              BonusTitleMailer.normal(user).deliver_now
            end
          else
            if @score.scc_4 >= 20000
              @bonus = member4 * 13
              if @day == 6
                BonusTitleMailer.basic(user).deliver_now
              end
            end
          end
        elsif (3 <= @q_value && @q_value <= 4)
          @bonus = member4 * 12
          if @day == 6
            BonusTitleMailer.crystal(user).deliver_now
          end
        elsif (5 <= @q_value && @q_value <= 6)
          @bonus = member4 * 11
          if @day == 6
            BonusTitleMailer.silver(user).deliver_now
          end
        elsif (7 <= @q_value && @q_value <= 8)
          @bonus = member4 * 10
          if @day == 6
            BonusTitleMailer.gold(user).deliver_now
          end
        else
          if @q_value >= 9
            @bonus = member4 * 9
            if @day == 6
              BonusTitleMailer.platinum(user).deliver_now
            end
          end
        end
        @last_year_point.c_4 = @bonus
        @last_year_point.save
      end
    end
  end 
    
  def self.bonus_right
    @customer = Customer.find_by(id: @sub_i)    
    nickname = @customer.nickname
    customer_ids = Sponsor.where(sponsor1: nickname).pluck(:customer_id) #紹介者のcustom_id配列で取得
    
    # 自分の紹介列のptを取り出しidを配列に代入する。
    sp1_qp_ary = []
    customer_ids.each do |z|
      sp_score = Point.find_by(customer_id: z)
      if @month == 4
        sp1_qp_ary << sp_score.cbns_1
      elsif @month == 7
        sp1_qp_ary << sp_score.cbns_2
      elsif @month == 10
        sp1_qp_ary << sp_score.cbns_3
      else
        if @month == 1
          sp1_qp_ary << sp_score.cbns_4
        end
      end
    end
    
    # 20000pt以上の列の数をチェック
    @q_value = sp1_qp_ary.count { |val| val >= 20000 }
  end
  
  def self.month_money
    user = Customer.find_by(id: @sub_i)
    abc = user.created_at.year
    bbb = user.created_at.month
    ccc = "-"
    @xxx = abc.to_s + ccc + bbb.to_s
    @zzz = @last_year.to_s + ccc + @last_month.to_s
    
    if @month == 1
      if user.new_register == 0
        if @xxx == @zzz
          user.new_register = 1
          user.save
          @score["sc_#{@last_month}"] = @score["sc_#{@last_month}"] + 700
          if @score["sc_#{@last_month}"] <= 700
            @last_year_point["m_#{@last_month}"] = 0
            @last_year_point.save
          elsif (700 < @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 1699)
            @last_year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"]  - 700
            @last_year_point.save
          elsif (1700 <= @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 31699) 
            @last_year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 1700
            @last_year_point.save
          else
            if @score["sc_#{@last_month}"] >= 31700
              @last_year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 2000
              @last_year_point.save
            end
          end
        elsif @score["sc_#{@last_month}"] <= 700
          @last_year_point["m_#{@last_month}"] = 0
          @last_year_point.save
        elsif (700 < @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 1699)
          @last_year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 700
          @last_year_point.save
        elsif (1700 <= @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 31699) 
          @last_year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 1700
          @last_year_point.save
        else
          if @score["sc_#{@last_month}"] >= 31700
            @last_year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 2000
            @last_year_point.save
          end
        end
      else
        if @score["sc_#{@last_month}"] <= 700
          @last_year_point["m_#{@last_month}"] = 0
          @last_year_point.save
        elsif (700 < @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 1699)
          @last_year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 700
          @last_year_point.save
        elsif (1700 <= @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 31699) 
          @last_year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 1700
          @last_year_point.save
        else
          if @score["sc_#{@last_month}"] >= 31700
            @last_year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 2000
            @last_year_point.save
          end
        end
      end
    else
      if user.new_register == 0
        if @xxx == @zzz
          user.new_register = 1
          user.save
          @score["sc_#{@last_month}"] = @score["sc_#{@last_month}"] + 700
          if @score["sc_#{@last_month}"] <= 700
            @year_point["m_#{@last_month}"] = 0
            @year_point.save
          elsif (700 < @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 1699)
            @year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"]  - 700
            @year_point.save
          elsif (1700 <= @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 31699) 
            @year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 1700
            @year_point.save
          else
            if @score["sc_#{@last_month}"] >= 31700
              @year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 2000
              @year_point.save
            end
          end
        elsif @score["sc_#{@last_month}"] <= 700
          @year_point["m_#{@last_month}"] = 0
          @year_point.save
        elsif (700 < @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 1699)
          @year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 700
          @year_point.save
        elsif (1700 <= @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 31699) 
          @year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 1700
          @year_point.save
        else
          if @score["sc_#{@last_month}"] >= 31700
            @year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 2000
            @year_point.save
          end
        end
      else
        if @score["sc_#{@last_month}"] <= 700
          @year_point["m_#{@last_month}"] = 0
          @year_point.save
        elsif (700 < @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 1699)
          @year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 700
          @year_point.save
        elsif (1700 <= @score["sc_#{@last_month}"] && @score["sc_#{@last_month}"] <= 31699) 
          @year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 1700
          @year_point.save
        else
          if @score["sc_#{@last_month}"] >= 31700
            @year_point["m_#{@last_month}"] = @score["sc_#{@last_month}"] - 2000
            @year_point.save
          end
        end
      end
    end
      
    if @month <= 11
      @month1 = @month + 1
    else
      @month1 = 1
    end
    
    if @month == 1
      if @day == 6
        if @last_year_point["m_#{@last_month}"] >= 30000
          CongratsMailer.membership_fee1(user).deliver_now
          reg = Register.find_by(customer_id: @sub_i)
          reg["rg_#{@month1}"] = "在籍"
          reg.save
        elsif @last_year_point["m_#{@last_month}"] >= 1700
          CongratsMailer.membership_fee(user).deliver_now
          reg = Register.find_by(customer_id: @sub_i)
          reg["rg_#{@month1}"] = "在籍"
          reg.save
        else
          if @last_year_point["m_#{@last_month}"] > 700
            CongratsMailer.membership_fee2(user).deliver_now
          end
        end
      end
    else
      if @day == 6
        if @year_point["m_#{@last_month}"] >= 30000
          CongratsMailer.membership_fee1(user).deliver_now
          reg = Register.find_by(customer_id: @sub_i)
          reg["rg_#{@month1}"] = "在籍"
          reg.save
        elsif @year_point["m_#{@last_month}"] >= 1700
          CongratsMailer.membership_fee(user).deliver_now
          reg = Register.find_by(customer_id: @sub_i)
          reg["rg_#{@month1}"] = "在籍"
          reg.save
        else
          if @year_point["m_#{@last_month}"] > 700
            CongratsMailer.membership_fee2(user).deliver_now
          end
        end
      end
    end
  end
  
  def self.bonus_sub
    user = Customer.find_by(id: @sub_i)
    if @month == 4
      if @score.scc_1 <= 4999
        @year_point.c_1 = 0
      else
        if @bonus - 700 >= 30000
          @year_point.c_1 = @bonus - 1000
          if @day == 6
            BonusMailer.bonus1_get(user).deliver_now
          end
        else
          @year_point.c_1 = @bonus - 700
          if @day == 6
            BonusMailer.bonus_get(user).deliver_now
          end
        end
      end
      
    elsif @month == 7
      if @score.scc_2 <= 4999
        @year_point.c_2 = 0
      else
        if @bonus - 700 >= 30000
          @year_point.c_2 = @bonus - 1000
          if @day == 6
            BonusMailer.bonus1_get(user).deliver_now
          end
        else
          @year_point.c_2 = @bonus - 700
          if @day == 6
            BonusMailer.bonus_get(user).deliver_now
          end
        end
      end
      
    elsif @month == 10
      if @score.scc_3 <= 4999
        @year_point.c_3 = 0
      else
        if @bonus - 700 >= 30000
          @year_point.c_3 = @bonus - 1000
          if @day == 6
            BonusMailer.bonus1_get(user).deliver_now
          end
        else
          @year_point.c_3 = @bonus - 700
          if @day == 6
            BonusMailer.bonus_get(user).deliver_now
          end
        end
      end
    else
      if @month == 1
        if @score.scc_4 <= 4999
          @last_year_point.c_4 = 0
        else
          if @bonus - 700 >= 30000
            @last_year_point.c_4 = @bonus - 1000
            if @day == 6
              BonusMailer.bonus1_get(user).deliver_now
            end
          else
            @last_year_point.c_4 = @bonus - 700
            if @day == 6
              BonusMailer.bonus_get(user).deliver_now
            end
          end
        end
      end
    end
    
    if user.member_type == "一般会員"
      if @month == 1
        @last_year_point.total = @last_year_point.m_1 + @last_year_point.m_2 + @last_year_point.m_3 + @last_year_point.c_1 + @last_year_point.m_4 + @last_year_point.m_5 + @last_year_point.m_6 +  @last_year_point.c_2 + @last_year_point.m_7 + @last_year_point.m_8 + @last_year_point.m_9 +  @last_year_point.c_3 + @last_year_point.m_10 + @last_year_point.m_11 + @last_year_point.m_12 + @last_year_point.c_4
        @last_year_point.save
      else
        @year_point.total = @year_point.m_1 + @year_point.m_2 + @year_point.m_3 + @year_point.c_1 + @year_point.m_4 + @year_point.m_5 + @year_point.m_6 +  @year_point.c_2 + @year_point.m_7 + @year_point.m_8 + @year_point.m_9 +  @year_point.c_3 + @year_point.m_10 + @year_point.m_11 + @year_point.m_12 + @year_point.c_4
        @year_point.save
      end
    else
      if @month == 1
        @last_year_point.total = @last_year_point.m_1 + @last_year_point.m_2 + @last_year_point.m_3 + @last_year_point.c_1 + @last_year_point.m_4 + @last_year_point.m_5 + @last_year_point.m_6 +  @last_year_point.c_2 + @last_year_point.m_7 + @last_year_point.m_8 + @last_year_point.m_9 +  @last_year_point.c_3 + @last_year_point.m_10 + @last_year_point.m_11 + @last_year_point.m_12 + @last_year_point.c_4 + @last_year_point.pt_special_1 + @last_year_point.pt_special_2 + @last_year_point.pt_special_3 + @last_year_point.pt_special_4 + @last_year_point.pt_special_5 + @last_year_point.pt_special_6 + @last_year_point.pt_special_7 + @last_year_point.pt_special_8 + @last_year_point.pt_special_9 + @last_year_point.pt_special_10 + @last_year_point.pt_special_11 + @last_year_point.pt_special_12
        @last_year_point.save
      else
        @year_point.total = @year_point.m_1 + @year_point.m_2 + @year_point.m_3 + @year_point.c_1 + @year_point.m_4 + @year_point.m_5 + @year_point.m_6 +  @year_point.c_2 + @year_point.m_7 + @year_point.m_8 + @year_point.m_9 +  @year_point.c_3 + @year_point.m_10 + @year_point.m_11 + @year_point.m_12 + @year_point.c_4 + @year_point.pt_special_1 + @year_point.pt_special_2 + @year_point.pt_special_3 + @year_point.pt_special_4 + @year_point.pt_special_5 + @year_point.pt_special_6 + @year_point.pt_special_7 + @year_point.pt_special_8 + @year_point.pt_special_9 + @year_point.pt_special_10 + @year_point.pt_special_11 + @year_point.pt_special_12
        @year_point.save
      end
    end
  end
end
