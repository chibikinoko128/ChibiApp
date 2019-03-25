class Admin::RecordsController < Admin::Base
  before_action :cache_payment, only: [:month_cache, :year_record, :sp_bonus]
  before_action :bonus_payment, only: [:quarter_bonus, :year_record]
  before_action :month_member,  only: [:month_cache, :quarter_bonus]
  def individual
    render action: 'individual'
  end
  
  def month_cache   #キャッシュバックの総支払い実績
    @year = @check.year
    @month = @check.month
    
    if @month == 1
      @cache_budget = @member_check * 158 
      @check_cache = @check_cache1
      @cache_profits = (@member_check * 158) - @check_cache1
    elsif @month == 2
      @cache_budget = @member_check * 158 
      @check_cache = @check_cache2
      @cache_profits = (@member_check * 158) - @check_cache2
    elsif @month == 3
      @cache_budget = @member_check * 158
      @check_cache = @check_cache3
      @cache_profits = (@member_check * 158) - @check_cache3
    elsif @month == 4
      @cache_budget = @member_check * 158
      @check_cache = @check_cache4
      @cache_profits = (@member_check * 158) - @check_cache4
    elsif @month == 5
      @cache_budget = @member_check * 158
      @check_cache = @check_cache5
      @cache_profits = (@member_check * 158) - @check_cache5
    elsif @month == 6
      @cache_budget = @member_check * 158
      @check_cache = @check_cache6
      @cache_profits = (@member_check * 158) - @check_cache6
    elsif @month == 7
      @cache_budget = @member_check * 158
      @check_cache = @check_cache7
      @cache_profits = (@member_check * 158) - @check_cache7
    elsif @month == 8
      @cache_budget = @member_check * 158
      @check_cache = @check_cache8
      @cache_profits = (@member_check * 158) - @check_cache8
    elsif @month == 9
      @cache_budget = @member_check * 158
      @check_cache = @check_cache9
      @cache_profits = (@member_check * 158) - @check_cache9
    elsif @month == 10
      @cache_budget = @member_check * 158
      @check_cache = @check_cache10
      @cache_profits = (@member_check * 158) - @check_cache10
    elsif @month == 11
      @cache_budget = @member_check * 158
      @check_cache = @check_cache11
      @cache_profits = (@member_check * 158) - @check_cache11
    else
      @cache_budget = @member_check * 158
      @check_cache = @check_cache12
      @cache_profits = (@member_check * 158) - @check_cache12
    end
  end
  
  def quarter_bonus  # ボーナスの総支払い実績
    @year = @check.year
    @month = @check.month
    
    if @month <= 3
      @quarter = 1
      @bonus_budget = @member_check * 70
      @check_bonus = @check_bonus1
      @bonus_profits = (@member_check * 70) - @check_bonus1
    elsif (4 <= @month && @month <=6)
      @quarter = 2
      @bonus_budget = @member_check * 70
      @check_bonus = @check_bonus2
      @bonus_profits = (@member_check * 70) - @check_bonus2
    elsif (7 <= @month && @month <= 9)
      @quarter = 3
      @bonus_budget = @member_check * 70
      @check_bonus = @check_bonus3
      @bonus_profits = (@member_check * 70) - @check_bonus3
    else
      @quarter = 4
      @bonus_budget = @member_check * 70
      @check_bonus = @check_bonus4
      @bonus_profits = (@member_check * 70) - @check_bonus4
    end 
  end
  
  def month_member
    @check = Retrieval.find(1)
    @year = @check.year
    @month = @check.month
    if @year == 2018
      @year_member = EighteenMember.find(1)
      month_member_sub
      
    elsif @year == 2019
      @year_member = NineteenMember.find(1)
      month_member_sub
      
    elsif @year == 2020
      @year_member = TwentieMember.find(1)
      month_member_sub
      
    elsif @year == 2021
      @year_member = OneMember.find(1)
      month_member_sub
      
    elsif @year == 2022
      @year_member = TwentyTwoMember.find(1)
      month_member_sub
      
    elsif @year == 2023
      @year_member = TwentyThreeMember.find(1)
      month_member_sub
      
    elsif @year == 2024
      @year_member = TwentyFourMember.find(1)
      month_member_sub
      
    elsif @year == 2025
      @year_member = TwentyFiveMember.find(1)
      month_member_sub
      
    elsif @year == 2026
      @year_member = TwentySixMember.find(1)
      month_member_sub
      
    else
      if @year == 2027
        @year_member = TwentySevenMember.find(1)
        month_member_sub
      end
    end
  end
  
  def month_member_sub
    if @check.month == 1
      @member_check = @year_member.om_1
    elsif @check.month == 2
      @member_check = @year_member.om_2
    elsif @check.month == 3
      @member_check = @year_member.om_3
    elsif @check.month == 4
      @member_check = @year_member.om_4
    elsif @check.month == 5
      @member_check = @year_member.om_5
    elsif @check.month == 6
      @member_check = @year_member.om_6
    elsif @check.month == 7
      @member_check = @year_member.om_7
    elsif @check.month == 8
      @member_check = @year_member.om_8
    elsif @check.month == 9
      @member_check = @year_member.om_9
    elsif @check.month == 10
      @member_check = @year_member.om_10
    elsif @check.month == 11
      @member_check = @year_member.om_11
    else
      @member_check = @year_member.om_12
    end
      
    @month_money = @member_check * 1000  # 総売り上げ
  end
  
  def sp_bonus #特別会員ボーナス支払い実績
    @year = @check.year
    @month = @check.month 
    if @month == 1
      @next_month = 2
      @check_sp = @check_sp1 
    elsif @month == 2
      @next_month = 3
      @check_sp = @check_sp2
    elsif @month == 3
      @next_month = 4
      @check_sp = @check_sp3
    elsif @month == 4
      @next_month = 5
      @check_sp = @check_sp4
    elsif @month == 5
      @next_month = 6
      @check_sp = @check_sp5
    elsif @month == 6
      @next_month = 7
      @check_sp = @check_sp6
    elsif @month == 7
      @next_month = 8
      @check_sp = @check_sp7
    elsif @month == 8
      @next_month = 9
      @check_sp = @check_sp8
    elsif @month == 9
      @next_month = 10
      @check_sp = @check_sp9
    elsif @month == 10
      @next_month = 11
      @check_sp = @check_sp10
    elsif @month == 11
      @next_month = 12
      @check_sp = @check_sp11
    else
      @next_month = 1
      @check_sp = @check_sp12
    end 
  end
      
  def year_record  # 月ごとの在籍者数実績と総利用料金額,粗利益
    @year = @check.year
  
    if @year == 2018
      @check_year = Eighteen
      @last_year = Eighteen
      eighteen = EighteenMember.find(1)
      if @month == 12
        @year_end_member = eighteen.em_12
      else
        @year_end_member = 0
      end
      
      year_profits_record
      
      @year_total_bonus = @check_bonus1 + @check_bonus2 + @check_bonus3 + @check_bonus4
      
      @year_total_cache = @check_cache1 + @check_cache2 + @check_cache3 + @check_cache4 + @check_cache5 + @check_cache6 + @check_cache7 + @check_cache8 + @check_cache9 + @check_cache10 + @check_cache11 + @check_cache12
      
      @year_total_sp = @check_sp1 + @check_sp2 + @check_sp3 + @check_sp4 + @check_sp5 + @check_sp6 + @check_sp7 + @check_sp8 + @check_sp9 + @check_sp10 + @check_sp11 + @check_sp12
      
      # 月ごとの粗利益  
      month1_member = eighteen.om_1
      month2_member = eighteen.om_2
      month3_member = eighteen.om_3
      month4_member = eighteen.om_4
      month5_member = eighteen.om_5
      month6_member = eighteen.om_6
      month7_member = eighteen.om_7
      month8_member = eighteen.om_8
      month9_member = eighteen.om_9
      month10_member = eighteen.om_10
      month11_member = eighteen.om_11
      month12_member = eighteen.om_12
      
      @gross_profit_month1 = (month1_member * 1000) - (month1_member * 70) - @check_cache1 - (month1_member * 100) - @check_sp1 - @month1_total
       
      @gross_profit_month2 = (month2_member * 1000) - @check_cache2 - (month2_member * 70) - (month2_member * 100) - @check_sp2 - @month2_total
      
      @gross_profit_month3 = (month3_member * 1000) - @check_cache3 - (month3_member * 70) - (month3_member * 100) - @check_sp3 - @check_bonus1 - @month3_total
      
      @gross_profit_month4 = (month4_member * 1000) - @check_cache4 - @check_bonus1 - (month4_member * 100) - @check_sp4 - @month4_total
      
      @gross_profit_month5 = (month5_member * 1000) - @check_cache5 - (month5_member * 70) - (month5_member * 100) - @check_sp5 - @month5_total
        
      @gross_profit_month6 = (month6_member * 1000) - @check_cache6 - (month6_member * 70) - (month6_member * 100) - @check_sp6 - @check_bonus2 - @month6_total
      
      @gross_profit_month7 = (month7_member * 1000) - @check_cache7 - @check_bonus2 - (month7_member * 100) - @check_sp7 - @month7_total
      
      @gross_profit_month8 = (month8_member * 1000) - @check_cache8 - (month8_member * 70) - (month8_member * 100) - @check_sp8 - @month8_total
        
      @gross_profit_month9 = (month9_member * 1000) - @check_cache9 - (month9_member * 70) - (month9_member * 100) - @check_sp9 - @check_bonus3 - @month9_total
      
      @gross_profit_month10 = (month10_member * 1000) - @check_cache10 - @check_bonus3 - (month10_member * 100) - @check_sp10 - @month10_total
      
      @gross_profit_month11 = (month11_member * 1000) - @check_cache11 - (month11_member * 70) - (month11_member * 100) - @check_sp11 - @month11_total
        
      @gross_profit_month12 = (month12_member * 1000) - @check_cache12 - (month12_member * 70) - (month12_member * 100) - @check_sp12 - @check_bonus4 - @month12_total
        
     # 年間粗利益
      @total_member = (eighteen.om_1 + eighteen.om_2 + eighteen.om_3 + eighteen.om_4 + eighteen.om_5 + eighteen.om_6 + eighteen.om_7 + eighteen.om_8 + eighteen.om_9 + eighteen.om_10 + eighteen.om_11 + eighteen.om_12)
      
      @gross_profit_year = (@total_member * 1000) - (Eighteen.sum("m_1") + Eighteen.sum("m_2") + Eighteen.sum("m_3") + Eighteen.sum("m_4") + Eighteen.sum("m_5") + Eighteen.sum("m_6") + Eighteen.sum("m_7") + Eighteen.sum("m_8") + Eighteen.sum("m_9") + Eighteen.sum("m_10") + Eighteen.sum("m_11") + Eighteen.sum("m_12") + Eighteen.sum("c_1") + Eighteen.sum("c_2") + Eighteen.sum("c_3") + Eighteen.sum("c_4") + Eighteen.sum("pt_special_1") + Eighteen.sum("pt_special_2") + Eighteen.sum("pt_special_3") + Eighteen.sum("pt_special_4") + Eighteen.sum("pt_special_5") + Eighteen.sum("pt_special_6") + Eighteen.sum("pt_special_7") + Eighteen.sum("pt_special_8") + Eighteen.sum("pt_special_9") + Eighteen.sum("pt_special_10") + Eighteen.sum("pt_special_11") + Eighteen.sum("pt_special_12")) - (@total_member * 100) - @year_total
      
      @privilege_budget = @total_member * 100 # 特典ボーナス予算
      @year_money = @total_member * 1000 # 年間総売上
      
    elsif @year == 2019
      @now_year_member = NineteenMember.find(1)
      @last_year = Eighteen
      @last_year_member = EighteenMember
      @check_year = Nineteen
      year_profits_record
      year_record_sub
      
    elsif @year == 2020
      @now_year_member = TwentieMember.find(1)
      @last_year = Nineteen
      @last_year_member = NineteenMember
      @check_year = Twentie
      year_profits_record
      year_record_sub
      
    elsif @year == 2021
      @now_year_member = OneMember.find(1)
      @last_year = Twentie
      @last_year_member = TwentieMember
      @check_year = One
      year_profits_record
      year_record_sub
      
    elsif @year == 2022
      @now_year_member = TwentyTwoMember.find(1)
      @last_year = One
      @last_year_member = OneMember
      @check_year = TwentyTwo
      year_profits_record
      year_record_sub
      
    elsif @year == 2023
      @now_year_member = TwentyThreeMember.find(1)
      @last_year = TwentyTwo
      @last_year_member = TwentyTwoMember
      @check_year = TwentyThree
      year_profits_record
      year_record_sub
      
    elsif @year == 2024
      @last_check_year = TwentyThree
      @now_year_member = TwentyFourMember.find(1)
      @last_year = TwentyThree
      @last_year_member = TwentyThreeMember
      @check_year = TwentyFour
      year_profits_record
      year_record_sub
      
    elsif @year == 2025
      @now_year_member = TwentyFiveMember.find(1)
      @last_year = TwentyFour
      @last_year_member = TwentyFourMember
      @check_year = TwentyFive
      year_profits_record
      year_record_sub
      
    elsif @year == 2026
      @now_year_member = TwentySixMember.find(1)
      @last_year = TwentyFive
      @last_year_member = TwentyFiveMember
      @check_year = TwentySix
      year_profits_record
      year_record_sub
      
    else
      if @year == 2027
        @now_year_member = TwentySevenMember.find(1)
        @last_year = TwentySix
        @last_year_member = TwentySixMember
        @check_year = TwentySeven
        year_profits_record
        year_record_sub
      end
    end
  end
  
  def year_record_sub
    if @month == 12
      @year_end_member = @now_year_member.om_12
    else
      @year_end_member = 0
    end
  
    # 月ごとの粗利益  
    @month1_member = @now_year_member.om_1
    @month2_member = @now_year_member.om_2
    @month3_member = @now_year_member.om_3
    @month4_member = @now_year_member.om_4
    @month5_member = @now_year_member.om_5
    @month6_member = @now_year_member.om_6
    @month7_member = @now_year_member.om_7
    @month8_member = @now_year_member.om_8
    @month9_member = @now_year_member.om_9
    @month10_member = @now_year_member.om_10
    @month11_member = @now_year_member.om_11
    @month12_member = @now_year_member.om_12
        
    year_check = @last_year_member.find(1)
    @before_member_check = year_check.om_12
    @check_bonus = @last_year.sum("c_4")
    
    #gross_point
      
    # 年間粗利益
    @total_member = (@now_year_member.om_1 + @now_year_member.om_2 + @now_year_member.om_3 + @now_year_member.om_4 + @now_year_member.om_5 + @now_year_member.om_6 + @now_year_member.om_7 + @now_year_member.om_8 + @now_year_member.om_9 + @now_year_member.om_10 + @now_year_member.om_11 + @now_year_member.om_12)
      
    @gross_profit_year = (@total_member * 1000) - (@check_year.sum("m_1") + @check_year.sum("m_2") + @check_year.sum("m_3") + @check_year.sum("m_4") + @check_year.sum("m_5") + @check_year.sum("m_6") + @check_year.sum("m_7") + @check_year.sum("m_8") + @check_year.sum("m_9") + @check_year.sum("m_10") + @check_year.sum("m_11") + @check_year.sum("m_12") - @check_year.sum("c_1") + @check_year.sum("c_2") + @check_year.sum("c_3") + @check_year.sum("c_4") + @check_year.sum("pt_special_1") + @check_year.sum("pt_special_2") + @check_year.sum("pt_special_3") + @check_year.sum("pt_special_4") + @check_year.sum("pt_special_5") + @check_year.sum("pt_special_6") + @check_year.sum("pt_special_7") + @check_year.sum("pt_special_8") + @check_year.sum("pt_special_9") + @check_year.sum("pt_special_10") + @check_year.sum("pt_special_11") + @check_year.sum("pt_special_12")) - (@total_member * 100) - @year_total
      
    @privilege_budget = @total_member * 100 # 特典ボーナス予算
    @year_money = @total_member * 1000 # 年間総売上
  end
  
  def year_profits_record
    commission = Commission.find_by(pay_bank: "振込")
    @bank_name = commission.bank_name
    @fee_low = commission.fee_low
    @fee_high = commission.fee_high
    
    #1月対象外
    unsub_m_11 = @last_year.where("m_11 = 0").pluck(:customer_id)
    sp_unsub_sp_12 = @last_year.where("pt_special_12 = 0").pluck(:customer_id)
    b_unsub_c_4 = @last_year.where("c_4 = 0").pluck(:customer_id)
    #2月対象外
    unsub_m_12 = @last_year.where("m_12 = 0").pluck(:customer_id)
    sp_unsub_sp_1 = @check_year.where("pt_special_1 = 0").pluck(:customer_id)
    #3月対象外
    unsub_m_1 = @check_year.where("m_1 = 0").pluck(:customer_id)
    sp_unsub_sp_2 = @check_year.where("pt_special_2 = 0").pluck(:customer_id)
    #4月対象外
    unsub_m_2 = @check_year.where("m_2 = 0").pluck(:customer_id)
    sp_unsub_sp_3 = @check_year.where("pt_special_3 = 0").pluck(:customer_id)
    b_unsub_c_1 = @check_year.where("c_1 = 0").pluck(:customer_id)
    #5月対象外
    unsub_m_3 = @check_year.where("m_3 = 0").pluck(:customer_id)
    sp_unsub_sp_4 = @check_year.where("pt_special_4 = 0").pluck(:customer_id)
    #6月対象外
    unsub_m_4 = @check_year.where("m_4 = 0").pluck(:customer_id)
    sp_unsub_sp_5 = @check_year.where("pt_special_5 = 0").pluck(:customer_id)
    #7月対象外
    unsub_m_5 = @check_year.where("m_5 = 0").pluck(:customer_id)
    sp_unsub_sp_6 = @check_year.where("pt_special_6 = 0").pluck(:customer_id)
    b_unsub_c_2 = @check_year.where("c_2 = 0").pluck(:customer_id)
    #8月対象外
    unsub_m_6 = @check_year.where("m_6 = 0").pluck(:customer_id)
    sp_unsub_sp_7 = @check_year.where("pt_special_7 = 0").pluck(:customer_id)
    #9月対象外
    unsub_m_7 = @check_year.where("m_7 = 0").pluck(:customer_id)
    sp_unsub_sp_8 = @check_year.where("pt_special_8 = 0").pluck(:customer_id)
    #10月対象外
    unsub_m_8 = @check_year.where("m_8 = 0").pluck(:customer_id)
    sp_unsub_sp_9 = @check_year.where("pt_special_9 = 0").pluck(:customer_id)
    b_unsub_c_3 = @check_year.where("c_3 = 0").pluck(:customer_id)
    #11月対象外
    unsub_m_9 = @check_year.where("m_9 = 0").pluck(:customer_id)
    sp_unsub_sp_10 = @check_year.where("pt_special_10 = 0").pluck(:customer_id)
    #12月対象外
    unsub_m_10 = @check_year.where("m_10 = 0").pluck(:customer_id)
    sp_unsub_sp_11 = @check_year.where("pt_special_11 = 0").pluck(:customer_id)
    
    #1月対象者
    @margin_c_low_m_11 = @last_year.where("m_11 < 30000").where.not(customer_id: [unsub_m_11]).count
      
    @margin_s_low_sp_12 = @last_year.where("pt_special_12 < 30000").where.not(customer_id: [sp_unsub_sp_12]).count
      
    @margin_b_low_c_4 = @last_year.where("c_4 < 30000").where.not(customer_id: [b_unsub_c_4]).count
      
    @margin_c_high_m_11 = @last_year.where("m_11 >= 30000").count
      
    @margin_s_high_sp_12 = @last_year.where("pt_special_12 >= 30000").count
      
    @margin_b_high_c_4 = @last_year.where("c_4 >= 30000").count
    
    #2月対象者
    @margin_c_low_m_12 = @last_year.where("m_12 < 30000").where.not(customer_id: [unsub_m_12]).count
      
    @margin_s_low_sp_1 = @check_year.where("pt_special_1 < 30000").where.not(customer_id: [sp_unsub_sp_1]).count
      
    @margin_c_high_m_12 = @last_year.where("m_12 >= 30000").count
      
    @margin_s_high_sp_1 = @check_year.where("pt_special_1 >= 30000").count
    
    #3月対象者
    @margin_c_low_m_1 = @check_year.where("m_1 < 30000").where.not(customer_id: [unsub_m_1]).count
      
    @margin_s_low_sp_2 = @check_year.where("pt_special_2 < 30000").where.not(customer_id: [sp_unsub_sp_2]).count
      
    @margin_c_high_m_1 = @check_year.where("m_1 > 30000").count
      
    @margin_s_high_sp_2 = @check_year.where("pt_special_2 >= 30000").count
    
    #4月対象者
    @margin_c_low_m_2 = @check_year.where("m_2 < 30000").where.not(customer_id: [unsub_m_2]).count
      
    @margin_s_low_sp_3 = @check_year.where("pt_special_3 < 30000").where.not(customer_id: [sp_unsub_sp_3]).count
      
    @margin_b_low_c_1 = @check_year.where("c_1 < 30000").where.not(customer_id: [b_unsub_c_1]).count
    
    @margin_c_high_m_2 = @check_year.where("m_2 > 30000").count
      
    @margin_s_high_sp_3 = @check_year.where("pt_special_3 >= 30000").count
      
    @margin_b_high_c_1 = @check_year.where("c_1 >= 30000").count
    
    #5月対象者
    @margin_c_low_m_3 = @check_year.where("m_3 < 30000").where.not(customer_id: [unsub_m_3]).count
      
    @margin_s_low_sp_4 = @check_year.where("pt_special_4 < 30000").where.not(customer_id: [sp_unsub_sp_4]).count
      
    @margin_c_high_m_3 = @check_year.where("m_3 >= 30000").count
      
    @margin_s_high_sp_4 = @check_year.where("pt_special_4 >= 30000").count
    
    #6月対象者
    @margin_c_low_m_4 = @check_year.where("m_4 < 30000").where.not(customer_id: [unsub_m_4]).count
      
    @margin_s_low_sp_5 = @check_year.where("pt_special_5 < 30000").where.not(customer_id: [sp_unsub_sp_5]).count
      
    @margin_c_high_m_4 = @check_year.where("m_4 >= 30000").count
      
    @margin_s_high_sp_5 = @check_year.where("pt_special_5 >= 30000").count
    
    #7月対象者
    @margin_c_low_m_5 = @check_year.where("m_5 < 30000").where.not(customer_id: [unsub_m_5]).count
      
    @margin_s_low_sp_6 = @check_year.where("pt_special_6 < 30000").where.not(customer_id: [sp_unsub_sp_6]).count
      
    @margin_b_low_c_2 = @check_year.where("c_2 < 30000").where.not(customer_id: [b_unsub_c_2]).count
      
    @margin_c_high_m_5 = @check_year.where("m_5 >= 30000").count
      
    @margin_s_high_sp_6 = @check_year.where("pt_special_6 >= 30000").count
      
    @margin_b_high_c_2 = @check_year.where("c_2 >= 30000").count
    
    #8月対象者
    @margin_c_low_m_6 = @check_year.where("m_6 < 30000").where.not(customer_id: [unsub_m_6]).count
        
    @margin_s_low_sp_7 = @check_year.where("pt_special_7 < 30000").where.not(customer_id: [sp_unsub_sp_7]).count
      
    @margin_c_high_m_6 = @check_year.where("m_6 >= 30000").count
      
    @margin_s_high_sp_7 = @check_year.where("pt_special_7 >= 30000").count
    
    #9月対象者
    @margin_c_low_m_7 = @check_year.where("m_7 < 30000").where.not(customer_id: [unsub_m_7]).count
      
    @margin_s_low_sp_8 = @check_year.where("pt_special_8 < 30000").where.not(customer_id: [sp_unsub_sp_8]).count
      
    @margin_c_high_m_7 = @check_year.where("m_7 >= 30000").count
      
    @margin_s_high_sp_8 = @check_year.where("pt_special_8 >= 30000").count
    
    #10月対象者
    @margin_c_low_m_8 = @check_year.where("m_8 < 30000").where.not(customer_id: [unsub_m_8]).count
      
    @margin_s_low_sp_9 = @check_year.where("pt_special_9 < 30000").where.not(customer_id: [sp_unsub_sp_9]).count
      
    @margin_b_low_c_3 = @check_year.where("c_3 < 30000").where.not(customer_id: [b_unsub_c_3]).count
      
    @margin_c_high_m_8 = @check_year.where("m_8 >= 30000").count
      
    @margin_s_high_sp_9 = @check_year.where("pt_special_9 >= 30000").count
      
    @margin_b_high_c_3 = @check_year.where("c_3 >= 30000").count
    
    #11月対象者
    @margin_c_low_m_9 = @check_year.where("m_9 < 30000").where.not(customer_id: [unsub_m_9]).count
      
    @margin_s_low_sp_10 = @check_year.where("pt_special_10 < 30000").where.not(customer_id: [sp_unsub_sp_10]).count
      
    @margin_c_high_m_9 = @check_year.where("m_9 >= 30000").count
      
    @margin_s_high_sp_10 = @check_year.where("pt_special_10 >= 30000").count
    
    #12月対象者
    @margin_c_low_m_10 = @check_year.where("m_10 < 30000").where.not(customer_id: [unsub_m_10]).count
      
    @margin_s_low_sp_11 = @check_year.where("pt_special_11 < 30000").where.not(customer_id: [sp_unsub_sp_11]).count
      
    @margin_c_high_m_10 = @check_year.where("m_10 >= 30000").count
      
    @margin_s_high_sp_11 = @check_year.where("pt_special_11 >= 30000").count
    
    #集計
    #３万円以下口数
    @year_margin_subtotal = @margin_c_low_m_11 + @margin_s_low_sp_12 + @margin_b_low_c_4 + @margin_c_low_m_12 + @margin_s_low_sp_1 + @margin_c_low_m_1 + @margin_s_low_sp_2 + @margin_c_low_m_2 + @margin_s_low_sp_3 + @margin_b_low_c_1 + @margin_c_low_m_3 + @margin_s_low_sp_4 + @margin_c_low_m_4 + @margin_s_low_sp_5 + @margin_c_low_m_5 + @margin_s_low_sp_6 + @margin_b_low_c_2 + @margin_c_low_m_6 + @margin_s_low_sp_7 + @margin_c_low_m_7 + @margin_s_low_sp_8 + @margin_c_low_m_8 + @margin_s_low_sp_9 + @margin_b_low_c_3 + @margin_c_low_m_9 + @margin_s_low_sp_10 + @margin_c_low_m_10 + @margin_s_low_sp_11
    
    #3万円以上口数
    @year_margin_total = @margin_c_high_m_11 + @margin_s_high_sp_12 + @margin_b_high_c_4 + @margin_c_high_m_12 + @margin_s_high_sp_1 + @margin_c_high_m_1 + @margin_s_high_sp_2 + @margin_c_high_m_2 + @margin_s_high_sp_3 + @margin_b_high_c_1 + @margin_c_high_m_3 + @margin_s_high_sp_4 + @margin_c_high_m_4 + @margin_s_high_sp_5 + @margin_c_high_m_5 + @margin_s_high_sp_6 + @margin_b_high_c_2 + @margin_c_high_m_6 + @margin_s_high_sp_7 + @margin_c_high_m_7 + @margin_s_high_sp_8 + @margin_c_high_m_8 + @margin_s_high_sp_9 + @margin_b_high_c_3 + @margin_c_high_m_9 + @margin_s_high_sp_10 + @margin_c_high_m_10 + @margin_s_high_sp_11
    
    #3万円以下金額
    @year_low_margin = @year_margin_subtotal * @fee_low
    @year_high_margin = @year_margin_total * @fee_high
    @year_total = @year_low_margin + @year_high_margin
    @year_profits = (@year_margin_subtotal * (700 - @fee_low)) +(@year_margin_total * (1000 - @fee_high))
    
    @month1_total = (@margin_c_low_m_1 + @margin_s_low_sp_1) * @fee_low + (@margin_c_high_m_1 + @margin_s_high_sp_1) * @fee_high 
    
    @month2_total = (@margin_c_low_m_2 + @margin_s_low_sp_2) * @fee_low + (@margin_c_high_m_2 + @margin_s_high_sp_2) * @fee_high
    
    @month3_total = (@margin_c_low_m_3 + @margin_s_low_sp_3 + @margin_b_low_c_1) * @fee_low + (@margin_c_high_m_3 + @margin_s_high_sp_3 + @margin_b_high_c_1) * @fee_high
    
    @month4_total = (@margin_c_low_m_4 + @margin_s_low_sp_4) * @fee_low + (@margin_c_high_m_4 + @margin_s_high_sp_4) * @fee_high
    
    @month5_total = (@margin_c_low_m_5 + @margin_s_low_sp_5) * @fee_low + (@margin_c_high_m_5 + @margin_s_high_sp_5) * @fee_high
    
    @month6_total = (@margin_c_low_m_6 + @margin_s_low_sp_6 + @margin_b_low_c_2) * @fee_low + (@margin_c_high_m_6 + @margin_s_high_sp_6 + @margin_b_high_c_2) * @fee_high
    
    @month7_total = (@margin_c_low_m_7 + @margin_s_low_sp_7) * @fee_low + (@margin_c_high_m_7 + @margin_s_high_sp_7) * @fee_high
    
    @month8_total = (@margin_c_low_m_8 + @margin_s_low_sp_8) * @fee_low + (@margin_c_high_m_8 + @margin_s_high_sp_8) * @fee_high
    
    @month9_total = (@margin_c_low_m_9 + @margin_s_low_sp_9 + @margin_b_low_c_3) * @fee_low + (@margin_c_high_m_9 + @margin_s_high_sp_9 + @margin_b_high_c_3) * @fee_high
    
    @month10_total = (@margin_c_low_m_10 + @margin_s_low_sp_10) * @fee_low + (@margin_c_high_m_10 + @margin_s_high_sp_10) * @fee_high
    
    @month11_total = (@margin_c_low_m_11 + @margin_s_low_sp_11) * @fee_low + (@margin_c_high_m_11 + @margin_s_high_sp_11) * @fee_high
    
    @month12_total = (@margin_c_low_m_12 + @margin_s_low_sp_12 + @margin_b_low_c_4) * @fee_low + (@margin_c_high_m_12 + @margin_s_high_sp_12 + @margin_b_high_c_4) * @fee_high
  end
  
  def cache_payment
    @check = Retrieval.find(1)
    if @check.year == 2018
      @check_year = Eighteen
      cache_payment_sub
      
    elsif @check.year == 2019
      @check_year = Nineteen
      cache_payment_sub
      
    elsif @check.year == 2020
      @check_year = Twentie
      cache_payment_sub
      
    elsif @check.year == 2021
      @check_year = One
      cache_payment_sub
      
    elsif @check.year == 2022
      @check_year = TwentyTwo
      cache_payment_sub
      
    elsif @check.year == 2023
      @check_year = TwentyThree
      cache_payment_sub
      
    elsif @check.year == 2024
      @check_year = TwentyFour
      cache_payment_sub

    elsif @check.year == 2025
      @check_year = TwentyFive
      cache_payment_sub

    elsif @check.year == 2026
      @check_year = TwentySix
      cache_payment_sub
      
    else
      if @check.year == 2027
        @check_year = TwentySeven
        cache_payment_sub
      end
    end
  end
  
  def cache_payment_sub
    @check_cache1 = @check_year.sum("m_1")    
    @check_cache2 = @check_year.sum("m_2")    
    @check_cache3 = @check_year.sum("m_3")     
    @check_cache3 = @check_year.sum("m_3")
    @check_cache4 = @check_year.sum("m_4")
    @check_cache5 = @check_year.sum("m_5")     
    @check_cache6 = @check_year.sum("m_6")   
    @check_cache7 = @check_year.sum("m_7")     
    @check_cache8 = @check_year.sum("m_8")   
    @check_cache9 = @check_year.sum("m_9")    
    @check_cache10 = @check_year.sum("m_10")     
    @check_cache11 = @check_year.sum("m_11")    
    @check_cache12 = @check_year.sum("m_12")
    @check_sp1 = @check_year.sum("pt_special_1")    
    @check_sp2 = @check_year.sum("pt_special_2")    
    @check_sp3 = @check_year.sum("pt_special_3")     
    @check_sp4 = @check_year.sum("pt_special_4")
    @check_sp5 = @check_year.sum("pt_special_5")     
    @check_sp6 = @check_year.sum("pt_special_6")   
    @check_sp7 = @check_year.sum("pt_special_7")     
    @check_sp8 = @check_year.sum("pt_special_8")   
    @check_sp9 = @check_year.sum("pt_special_9")    
    @check_sp10 = @check_year.sum("pt_special_10")     
    @check_sp11 = @check_year.sum("pt_special_11")    
    @check_sp12 = @check_year.sum("pt_special_12")
  end
  
  def bonus_payment
    @check = Retrieval.find(1)
    if @check.year == 2018
      @check_year = Eighteen
      bonus_payment_sub
    elsif @check.year == 2019
      @check_year = Nineteen
      bonus_payment_sub
    elsif @check.year == 2020
      @check_year = Twentie
      bonus_payment_sub
    elsif @check.year == 2021
      @check_year = One
      bonus_payment_sub
    elsif @check.year == 2022
      @check_year = TwentyTwo
      bonus_payment_sub
    elsif @check.year == 2023
      @check_year = TwentyThree
      bonus_payment_sub
    elsif @check.year == 2024
      @check_year = TwentyFour
      bonus_payment_sub
    elsif @check.year == 2025
      @check_year = TwentyFive
      bonus_payment_sub
    elsif @check.year == 2026
      @check_year = TwentySix
      bonus_payment_sub
    else
      if @check.year == 2027
        @check_year = TwentySeven
        bonus_payment_sub
      end
    end
  end
  
  def bonus_payment_sub
    if @check.month <= 3
      @quater = 1
    elsif (4 <= @check.month && @check.month <= 6)
      @quater = 2
    elsif (7 <= @check.month && @check.month <= 9)
      @quater = 3
    else
      @quater = 4
    end
    @check_bonus1 = @check_year.sum("c_1")
    @check_bonus2 = @check_year.sum("c_2")
    @check_bonus3 = @check_year.sum("c_3")
    @check_bonus4 = @check_year.sum("c_4") 
  end
  
  def eighteen_total_member
    @total_membr = (eighteen.em_1 + eighteen.em2 + eighteen.em_3 + eighteen.em_4 + eighteen.em_5 + eighteen.em_6 + eighteen.em_7 + eighteen.em_8 + eighteen.em_9 + eighteen.em_10 + eighteen.em_11 + eighteen.em_12)
  end
  
  def nineteen_total_member
    @total_member = (nineteen.nm_1 + nineteen.nm2 + nineteen.nm_3 + nineteen.nm_4 + nineteen.nm_5 + nineteen.nm_6 + nineteen.nm_7 + nineteen.nm_8 + nineteen.nm_9 + nineteen.nm_10 + nineteen.nm_11 + nineteen.nm_12)
  end
  
  def twentie_total_member
    @total_member = (twentie.tm_1 + twentie.tm2 + twentie.tm_3 + twentie.tm_4 + twentie.tm_5 + twentie.tm_6 + twentie.tm_7 + twentie.tm_8 + twentie.tm_9 + twentie.tm_10 + twentie.tm_11 + twentie.tm_12)
  end
  
  def one_total_member
    total_member_sub
  end

  def twenty_two_total_member
    total_member_sub
  end

  def twenty_three_total_member
    total_member_sub
  end

  def twenty_four_total_member
    total_member_sub
  end

  def twenty_five_total_member
    total_member_sub
  end

  def twenty_six_total_member
    total_member_sub
  end

  def twenty_seven_total_member
    total_member_sub
  end
  
  def total_member_sub
    @total_member = (twenty_seven.om_1 + twenty_seven.om2 + twenty_seven.om_3 + twenty_seven.om_4 + twenty_seven.om_5 + twenty_seven.om_6 + twenty_seven.om_7 + twenty_seven.om_8 + twenty_seven.om_9 + twenty_seven.om_10 + twenty_seven.om_11 + twenty_seven.om_12)
  end
    
  def gross_point
    @gross_profit_month1 = (@month1_member * 1000 + @before_member_check * 70) - @check_cache1 - (@month1_member * 100) - (@month1_member * 70) -@check_sp1
       
    @gross_profit_month2 = (@month2_member * 1000) - @check_cache2 - (@month2_member * 70) - (@month2_member * 100) -@check_sp2
        
    @gross_profit_month3 = (@month3_member * 1000) - @check_cache3 - (@month3_member * 70) - @check_bonus1 - (@month3_member * 100) -@check_sp3
      
    @gross_profit_month4 = (@month4_member * 1000) - @check_cache4 - (@month4_member * 100) - (@month4_member * 70) -@check_sp4
      
    @gross_profit_month5 = (@month5_member * 1000) - @check_cache5 - (@month5_member * 70) - (@month5_member * 100) -@check_sp5
        
    @gross_profit_month6 = (@month6_member * 1000) - @check_cache6 - (@month6_member * 70)- @check_bonus2 - (@month6_member * 100) -@check_sp6
      
    @gross_profit_month7 = (@month7_member * 1000) - @check_cache7 - @check_bonus2 - (@month7_member * 100) -@check_sp7
      
    @gross_profit_month8 = (@month8_member * 1000) - @check_cache8 - (@month8_member * 70) - (@month8_member * 100) -@check_sp8
        
    @gross_profit_month9 = (@month9_member * 1000) - @check_cache9 - (@month9_member * 70)- @check_bonus3 - (@month9_member * 100) -@check_sp9
      
    @gross_profit_month10 = (@month10_member * 1000) - @check_cache10 - @check_bonus3 - (@month10_member * 100) -@check_sp10
      
    @gross_profit_month11 = (@month11_member * 1000) - @check_cache11 - (@month11_member * 70) - (@month11_member * 100) -@check_sp11
        
    @gross_profit_month12 = (@month12_member * 1000) - @check_cache12 - (@month12_member * 70)- @check_bonus4 - (@month12_member * 100) -@check_sp12
  end
  
  def cache_acquisition
    @choice = Choice.find(1)
    @choice.remuneration = "キャッシュバック"
    @choice.detection = 0
    @choice.save
    
    time = Time.zone.now
    @year_now = time.year
    @month_now = time.month
    check = Pay.find(1)
    @year = check.year
    @month = check.month
    #$quarter20 = 10
    if @year == 2018
      @check_year = Eighteen
      cache_acquisition_sub
      
    elsif @year == 2019
      @check_year = Nineteen
      cache_acquisition_sub
      
    elsif @year == 2020
      @check_year = Twentie
      cache_acquisition_sub
      
    elsif @year == 2021
      @check_year = One
      cache_acquisition_sub
      
    elsif @year == 2022
      @check_year = TwentyTwo
      cache_acquisition_sub
      
    elsif @year == 2023
      @check_year = TwentyThree
      cache_acquisition_sub
      
    elsif @year == 2024
      @check_year = TwentyFour
      cache_acquisition_sub
      
    elsif @year == 2025
      @check_year = TwentyFive
      cache_acquisition_sub
      
    elsif @year == 2026
      @check_year = TwentySix
      cache_acquisition_sub
      
    else
      if @year == 2027
        @check_year = TwentySeven
        cache_acquisition_sub
        
      end
    end
  end
  
  def cache_acquisition_sub
    
    if @month == 1
      @month_pay = '3月末'
      @cacheback_member = @check_year.where("m_1 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_1")
    elsif @month == 2
      @month_pay = '4月末'
      @cacheback_member = @check_year.where("m_2 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_2")
    elsif @month == 3
      @month_pay = '5月末'
      @cacheback_member = @check_year.where("m_3 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_3")
    elsif @month == 4
      @month_pay = '6月末'
      @cacheback_member = @check_year.where("m_4 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_4")
    elsif @month == 5
      @month_pay = '7月末'
      @cacheback_member = @check_year.where("m_5 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_5")
    elsif @month == 6
      @month_pay = '8月末'
      @cacheback_member = @check_year.where("m_6 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_6")
    elsif @month == 7
      @month_pay = '9月末'
      @cacheback_member = @check_year.where("m_7 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_7")
    elsif @month == 8
      @month_pay = '10月末'
      @cacheback_member = @check_year.where("m_8 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_8")
    elsif @month == 9
      @month_pay = '11月末'
      @cacheback_member = @check_year.where("m_9 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_9")
    elsif @month == 10
      @month_pay = '12月末'
      @cacheback_member = @check_year.where("m_10 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_10")
    elsif @month == 11
      @month_pay = '1月末'
      @cacheback_member = @check_year.where("m_11 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_11")
    else
      @month_pay = '2月末'
      @cacheback_member = @check_year.where("m_12 > 0").page(params[:page])
      @total_cash_pay = @check_year.sum("m_12")
    end
  end
    
  
  def bonus_acquisition
    @choice = Choice.find(1)
    @choice.detection = 0
    @choice.remuneration = "ボーナス"
    @choice.save
    time = Time.zone.now
    @year_now = time.year
    @month_now = time.month
    check = Pay.find(1)
    @year = check.year
    @month = check.month
    @quarter = check.quarter
    
    
    #$quarter20 = 20
    
    if @month_now <= 3
      @quarter_now = 1
    elsif @month_now <= 6
      @quarter_now = 2
    elsif @month_now <= 9
      @quarter_now = 3
    else
      @quarter_now = 4
    end
    

    if @quarter == 1
      @quarter1 = 1
      @quarter3 = 1
    elsif @quarter == 2
      @quarter1 = 2
      @quarter3 = 2
    elsif @quarter == 3
      @quarter1 = 3
      @quarter3 = 3
    elsif @quarter == 4
      @quarter1 = 4
      @quarter3 = 4
    else  #quarterが0だったら
      if @month == 3
        @quarter = 1
        @quarter1 = 1
        @quarter3 = 1
      elsif @month == 6
        @quarter = 2
        @quarter1 = 2
        @quarter3 = 2
      elsif @month == 9
        @quarter = 3
        @quarter1 = 3
        @quarter3 = 3
      elsif @month == 12
        @quarter = 4
        @quarter1 = 4
        @quarter3 = 4
      else
        @quarter1 = 5
        if @month <= 2
          @quarter = 1
          @quarter3 = 1
        elsif @month <= 5
          @quarter = 2
          @quarter3 = 2
        elsif @month <= 8
          @quarter = 3
          @quarter3 = 3
        else
          @quarter = 4
          @quarter3 = 4
        end  
      end
    end
    
    
    if @year == 2018
      @check_year = Eighteen
      bonus_acquisition_sub
      
    elsif @year == 2019
      @check_year = Nineteen
      bonus_acquisition_sub
      
    elsif @year == 2020
      @check_year = Twentie
      bonus_acquisition_sub
      
    elsif @year == 2021
      @check_year = One
      bonus_acquisition_sub
     
    elsif @year == 2022
      @check_year = TwentyTwo
      bonus_acquisition_sub
      
    elsif @year == 2023
      @check_year = TwentyThree
      bonus_acquisition_sub
      
    elsif @year == 2024
      @check_year = TwentyFour
      bonus_acquisition_sub
      
    elsif @year == 2025
      @check_year = TwentyFive
      bonus_acquisition_sub
      
    elsif @year == 2026
      @check_year = TwentySix
      bonus_acquisition_sub
      
    else
      if @year == 2027
        @check_year = TwentySeven
        bonus_acquisition_sub
       
      end
    end
  end
  
  def bonus_acquisition_sub
    
    if @quarter3 == 1
      @bonus_pay = '4月末'
      @bonus_member = @check_year.where("c_1 > 0").page(params[:page])
      @total_bonus_pay = @check_year.sum("c_1")
    elsif @quarter3 == 2
      @bonus_pay = '7月末'
      @bonus_member = @check_year.where("c_2 > 0").page(params[:page])
      @total_bonus_pay = @check_year.sum("c_2")
    elsif @quarter3 == 3
      @bonus_pay = '10月末'
      @bonus_member = @check_year.where("c_3 > 0").page(params[:page])
      @total_bonus_pay = @check_year.sum("c_3")
    else
      if @quarter3 == 4
        @bonus_pay = '1月末'
        @bonus_member = @check_year.where("c_4 > 0").page(params[:page])
        @total_bonus_pay = @check_year.sum("c_4")
      end
    end
  end
  
  def edit
    render action: 'acquisition_member'
  end
  
  def account_change
    time = Time.zone.now
    month = time.month
    if month == 1
      @sub = Register.where(rg_1: "在籍").pluck(:customer_id)
    elsif month == 2
      @sub = Register.where(rg_2: "在籍").pluck(:customer_id)
    elsif month == 3
      @sub = Register.where(rg_3: "在籍").pluck(:customer_id)
    elsif month == 4
      @sub = Register.where(rg_4: "在籍").pluck(:customer_id)
    elsif month == 5
      @sub = Register.where(rg_5: "在籍").pluck(:customer_id)
    elsif month == 6
      @sub = Register.where(rg_6: "在籍").pluck(:customer_id)
    elsif month == 7
      @sub = Register.where(rg_7: "在籍").pluck(:customer_id)
    elsif month == 8
      @sub = Register.where(rg_8: "在籍").pluck(:customer_id)
    elsif month == 9
      @sub = Register.where(rg_9: "在籍").pluck(:customer_id)
    elsif month == 10
      @sub = Register.where(rg_10: "在籍").pluck(:customer_id)
    elsif month == 11
      @sub = Register.where(rg_11: "在籍").pluck(:customer_id)
    else
      @sub = Register.where(rg_12: "在籍").pluck(:customer_id)
    end
  end
  
  def acquisition_member
    render action: 'acquisition_member'
  end
  
  def day_admission
    time = Time.zone.now
    @year = time.year
    @month = time.month
    @day = time.day
    a = Admission.find(1)
    @k = a.entries_day.to_s
    @l = a.entries_day.to_s
    if a.entries_day.to_s == "集計"
      @b = a.entries_year.to_i
      @c = a.entries_month.to_i
      from = Date.new(@b,@c).beginning_of_day
      to = (from + 1.month)
      @day_admission = Customer.where(created_at: from..to).page(params[:page])
      @day_admission_2 = Customer.where(created_at: from..to).pluck(:id)
      @len = @day_admission_2.length
    elsif a.entries_day.to_s == "未入金"
      @b = a.entries_year.to_i
      @c = a.entries_month.to_i
      from = Date.new(@b,@c).beginning_of_day     
      to = (from + 1.month)
      abc = Customer.where(created_at: from..to).pluck(:id)
      @day_admission = []
      abc.each do |e|
        x = Register.find_by(customer_id: e)
        
        if x["rg_#{@c.to_s}"] == "退会"
          @day_admission << e
          @h = "退会"
          @j = "未入金"
        end
      end
      @len = @day_admission.length
    else
      @b = a.entries_year.to_s
      @c = a.entries_month.to_s
      @d = a.entries_day.to_s
      e = "-"
      f = @b + e + @c + e + @d
      @day_admission = Customer.where(created_at: f.in_time_zone.all_day).page(params[:page])
      @day_admission_1 = Customer.where(created_at: f.in_time_zone.all_day).pluck(:id)
      @len = @day_admission_1.length 
      
    end
  end
  
  def event
    time = Time.zone.now
    @month = time.month
    if @month == 1
      @sub = Register.where(rg_1: "在籍").pluck(:customer_id)
    elsif @month == 2
      @sub = Register.where(rg_2: "在籍").pluck(:customer_id)
    elsif @month == 3
      @sub = Register.where(rg_3: "在籍").pluck(:customer_id)
    elsif @month == 4
      @sub = Register.where(rg_4: "在籍").pluck(:customer_id)
    elsif @month == 5
      @sub = Register.where(rg_5: "在籍").pluck(:customer_id)
    elsif @mouth == 6
      @sub = Register.where(rg_6: "在籍").pluck(:customer_id)
    elsif @month == 7
      @sub = Register.where(rg_7: "在籍").pluck(:customer_id)
    elsif @month == 8
      @sub = Register.where(rg_8: "在籍").pluck(:customer_id)
    elsif @month == 9
      @sub = Register.where(rg_9: "在籍").pluck(:customer_id)
    elsif @month == 10
      @sub = Register.where(rg_10: "在籍").pluck(:customer_id)
    elsif @month == 11
      @sub = Register.where(rg_11: "在籍").pluck(:customer_id)
    else
      @sub = Register.where(rg_12: "在籍").pluck(:customer_id)
    end
    
    @sub.each do |m|
      user = Customer.find_by(id: m)
      EventMailer.notification(user).deliver_now
    end
  end
  
  def information
    time = Time.zone.now
    @month = time.month
    if @month == 1
      @sub = Register.where(rg_1: "在籍").pluck(:customer_id)
    elsif @month == 2
      @sub = Register.where(rg_2: "在籍").pluck(:customer_id)
    elsif @month == 3
      @sub = Register.where(rg_3: "在籍").pluck(:customer_id)
    elsif @month == 4
      @sub = Register.where(rg_4: "在籍").pluck(:customer_id)
    elsif @month == 5
      @sub = Register.where(rg_5: "在籍").pluck(:customer_id)
    elsif @mouth == 6
      @sub = Register.where(rg_6: "在籍").pluck(:customer_id)
    elsif @month == 7
      @sub = Register.where(rg_7: "在籍").pluck(:customer_id)
    elsif @month == 8
      @sub = Register.where(rg_8: "在籍").pluck(:customer_id)
    elsif @month == 9
      @sub = Register.where(rg_9: "在籍").pluck(:customer_id)
    elsif @month == 10
      @sub = Register.where(rg_10: "在籍").pluck(:customer_id)
    elsif @month == 11
      @sub = Register.where(rg_11: "在籍").pluck(:customer_id)
    else
      @sub = Register.where(rg_12: "在籍").pluck(:customer_id)
    end
    
    @sub.each do |m|
      user = Customer.find_by(id: m)
      InformationMailer.notification(user).deliver_now
    end
  end
  
  def sp_member
    @choice = Choice.find(1)
    @choice.detection = 0
    @choice.remuneration = "特別会員ボーナス"
    @choice.save
    
    time = Time.zone.now
    @year_now = time.year
    @month_now = time.month
    check = Pay.find(1)
    @year = check.year
    @month = check.month
    @quarter = check.quarter
    
    #$quarter20 = 30
    @common_member = Customer.where(member_type: "一般会員").pluck(:id)
    if @year == 2018
      @check_year = Eighteen
      sp_member_sub
      
    elsif @year == 2019
      @check_year = Nineteen
      sp_member_sub
      
    elsif @year == 2020
      @check_year = Twentie
      sp_member_sub
      
    elsif @year == 2021
      @check_year = One
      sp_member_sub
      
    elsif @year == 2022
      @check_year = TwentyTwo
      sp_member_sub
      
    elsif @year == 2023
      @check_year = TwentyThree
      sp_member_sub
      
    elsif @year == 2024
      @check_year = TwentyFour
      sp_member_sub
      
    elsif @year == 2025
      @check_year = TwentyFive
      sp_member_sub
      
    elsif @year == 2026
      @check_year = TwentySix
      sp_member_sub
      
    else
      if @year == 2027
        @check_year = TwentySeven
        sp_member_sub
       
      end
    end
  end
  
  def sp_member_sub
    
    if @month == 1
      @sp_pay = '2月末'
      @sp_member = @check_year.where("pt_special_1 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_1 > 0").where.not(customer_id: [@common_member]).sum("pt_special_1") 
    elsif @month == 2
      @sp_pay = '3月末'
      @sp_member = @check_year.where("pt_special_2 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_2 > 0").where.not(customer_id: [@common_member]).sum("pt_special_2")
    elsif @month == 3
      @sp_pay = '4月末'
      @sp_member = @check_year.where("pt_special_3 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_3 > 0").where.not(customer_id: [@common_member]).sum("pt_special_3")
    elsif @month == 4
      @sp_pay = '5月末'
      @sp_member = @check_year.where("pt_special_4 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_4 > 0").where.not(customer_id: [@common_member]).sum("pt_special_4")
    elsif @month == 5
      @sp_pay = '6月末'
      @sp_member = @check_year.where("pt_special_5 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_5 > 0").where.not(customer_id: [@common_member]).sum("pt_special_5")
    elsif @month == 6
      @sp_pay = '7月末'
      @sp_member = @check_year.where("pt_special_6 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_6 > 0").where.not(customer_id: [@common_member]).sum("pt_special_6")
    elsif @month == 7
      @sp_pay = '8月末'
      @sp_member = @check_year.where("pt_special_7 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_7 > 0").where.not(customer_id: [@common_member]).sum("pt_special_7")
    elsif @month == 8
      @sp_pay = '9月末'
      @sp_member = @check_year.where("pt_special_8 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_8 > 0").where.not(customer_id: [@common_member]).sum("pt_special_8")
    elsif @month == 9
      @sp_pay = '10月末'
      @sp_member = @check_year.where("pt_special_9 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_9 > 0").where.not(customer_id: [@common_member]).sum("pt_special_9")
    elsif @month == 10
      @sp_pay = '11月末'
      @sp_member = @check_year.where("pt_special_10 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_10 > 0").where.not(customer_id: [@common_member]).sum("pt_special_10")
    elsif @month == 11
      @sp_pay = '12月末'
      @sp_member = @check_year.where("pt_special_11 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_11 > 0").where.not(customer_id: [@common_member]).sum("pt_special_11")
    else
      @sp_pay = '1月末'
      @sp_member = @check_year.where("pt_special_12 > 0").where.not(customer_id: [@common_member]).page(params[:page])
      @total_special_pay = @check_year.where("pt_special_12 > 0").where.not(customer_id: [@common_member]).sum("pt_special_12")
    end
  end
  
  def not_payment
    time = Time.zone.now
    @month = time.month
    if @month <= 11
      @next_month = @month + 1
    else
      @next_month = 1
    end
    
    if @month == 1
      @sub = Register.where(rg_1: "在籍").page(params[:page])
    elsif @month == 2
      @sub = Register.where(rg_2: "在籍").page(params[:page])
    elsif @month == 3
      @sub = Register.where(rg_3: "在籍").page(params[:page])
    elsif @month == 4
      @sub = Register.where(rg_4: "在籍").page(params[:page])
    elsif @month == 5
      @sub = Register.where(rg_5: "在籍").page(params[:page])
    elsif @month == 6
      @sub = Register.where(rg_6: "在籍").page(params[:page])
    elsif @month == 7
      @sub = Register.where(rg_7: "在籍").page(params[:page])
    elsif @month == 8
      @sub = Register.where(rg_8: "在籍").page(params[:page])
    elsif @month == 9
      @sub = Register.where(rg_9: "在籍").page(params[:page])
    elsif @month == 10
      @sub = Register.where(rg_10: "在籍").page(params[:page])
    elsif @month == 11
      @sub = Register.where(rg_11: "在籍").page(params[:page])
    else 
      @sub = Register.where(rg_12: "在籍").page(params[:page])
    end
  end
  
  def payment_list
    @choice = Choice.find(1)
    @choice.detection = 1
    @choice.save
    
    time = Time.zone.now
    @year_now = time.year
    @month_now = time.month
    @check = Retrieval.find(1)
    @year = @check.year
    @month = @check.month
    @common_member = Customer.where(member_type: "一般会員").pluck(:id)
    if @month == 1
      @cache_month = 11
      @bonus_month = 12
      @sp_month = 12
    elsif @month == 2
      @cache_month = 12
      @bonus_month = 1
      @sp_month = 1
    else
      @cache_month = @month - 2
      @bonus_month = @month - 1
      @sp_month = @month - 1
    end
    
    if @year == 2018
      @check_year = Eighteen
      @last_check_year = Eighteen
      cash_back_sub
      bonus_sub
      special_sub
      
    elsif @year == 2019
      @check_year = Nineteen
      @last_check_year = Eighteen
      cash_back_sub
      bonus_sub
      special_sub
      
    elsif @year == 2020
      @check_year = Twentie
      @last_check_year = Nineteen
      cash_back_sub
      bonus_sub
      special_sub
      
    elsif @year == 2021
      @check_year = One
      @last_check_year = Twentie
      cash_back_sub
      bonus_sub
      special_sub
      
    elsif @year == 2022
      @check_year = TwentyTwo
      @last_check_year = One
      cash_back_sub
      bonus_sub
      special_sub
      
    elsif @year == 2023
      @check_year = TwentyThree
      @last_check_year = TwentyTwo
      cash_back_sub
      bonus_sub
      special_sub
      
    elsif @year == 2024
      @check_year = TwentyFour
      @last_check_year = TwentyThree
      cash_back_sub
      bonus_sub
      special_sub
      
    elsif @year == 2025
      @check_year = TwentyFive
      @last_check_year = TwentyFour
      cash_back_sub
      bonus_sub
      special_sub
      
    elsif @year == 2026
      @check_year = TwentySix
      @last_check_year = TwentyFive
      cash_back_sub
      bonus_sub
      special_sub
      
    else
      if @year == 2027
        @check_year = TwentySeven
        @last_check_year = TwentySix
        cash_back_sub
        bonus_sub
        special_sub
      end
    end
  end
  
  def cash_back_sub
    
    if @month == 1
      @cache_year = @year - 1
      @bonus_year = @year - 1
      @sp_year = @year - 1
      cash_complete = @last_check_year.where(transfer_m_11: "送金済").pluck(:customer_id)
      @cash_list = @last_check_year.where("m_11 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 2
      @cache_year = @year - 1
      @sp_year = @year
      cash_complete = @last_check_year.where(transfer_m_12: "送金済").pluck(:customer_id)
      @cash_list = @last_check_year.where("m_12 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 3
      @cache_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_1: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_1 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 4
      @cache_year = @year
      @bonus_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_2: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_2 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 5
      @cache_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_3: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_3 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 6
      @cache_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_4: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_4 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 7
      @cache_year = @year
      @bonus_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_5: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_5 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 8
      @cache_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_6: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_6 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 9
      @cache_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_7: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_7 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 10
      @cache_year = @year 
      @bonus_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_8: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_8 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    elsif @month == 11
      @cache_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_9: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_9 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    else
      @cache_year = @year
      @sp_year = @year
      cash_complete = @check_year.where(transfer_m_10: "送金済").pluck(:customer_id)
      @cash_list = @check_year.where("m_10 > 0").where.not(customer_id: [cash_complete]).page(params[:page])
    end
  end   
      
  def bonus_sub
    
    if @month == 1
      @cache_year = @year - 1
      @bonus_year = @year - 1
      @sp_year = @year - 1
      bonus_complete = @last_check_year.where(transfer_c_4: "送金済").pluck(:customer_id) 
      @bonus_list = @last_check_year.where("c_4 > 0").where.not(customer_id: [bonus_complete]).page(params[:page])
      @quarter = 4
    elsif @month == 4
      @cache_year = @year
      @bonus_year = @year
      @sp_year = @year
      bonus_complete = @check_year.where(transfer_c_1: "送金済").pluck(:customer_id) 
      @bonus_list = @check_year.where("c_1 > 0").where.not(customer_id: [bonus_complete]).page(params[:page])
      @quarter = 1
    elsif @month == 7
      @cache_year = @year
      @bonus_year = @year
      @sp_year = @year
      bonus_complete = @check_year.where(transfer_c_2: "送金済").pluck(:customer_id)
      @bonus_list = @check_year.where("c_2 > 0").where.not(customer_id: [bonus_complete]).page(params[:page])
      @quarter = 2
    else
      if @month == 10
        @cache_year = @year 
        @bonus_year = @year
        @sp_year = @year
        bonus_complete = @check_year.where(transfer_c_3: "送金済").pluck(:customer_id)
        @bonus_list = @check_year.where("c_3 > 0").where.not(customer_id: [bonus_complete]).page(params[:page])
        @quarter = 3
      end
    end
  end  
    
  def special_sub
    
    if @month == 1
      @sp_year = @year - 1
      sp_complete = @last_check_year.where(sp_transfer_12: "送金済").pluck(:customer_id)
      @sp_list = @last_check_year.where("pt_special_12 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 2
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_1: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_1 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 3
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_2: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_2 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 4
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_3: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_3 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 5
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_4: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_4 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 6
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_5: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_5 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 7
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_6: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_6 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 8
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_7: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_7 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 9
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_8: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_8 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 10 
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_9: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_9 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    elsif @month == 11
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_10: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_10 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    else
      @sp_year = @year
      sp_complete = @check_year.where(sp_transfer_11: "送金済").pluck(:customer_id)
      @sp_list = @check_year.where("pt_special_11 > 0").where.not(customer_id: [sp_complete]).where.not(customer_id: [@common_member]).page(params[:page])
    end
  end
  
  def cache
    time = Time.zone.now
    @year = time.year
    @month = time.month
    if @year == 2018
      cache_ud_sub
    elsif @year == 2019
      cache_ud_sub
    elsif @year == 2020
      cache_ud_sub
    elsif @year == 2021
      cache_ud_sub
    elsif @year == 2022
      cache_ud_sub
    elsif @year == 2023
      cache_ud_sub
    elsif @year == 2024
      cache_ud_sub
    elsif @year == 2025
      cache_ud_sub
    elsif @year == 2026
      cache_ud_sub
    else
      if @year == 2027
        cache_ud_sub
      end
    end
  end
  
  def cache_ud_sub
    if @month == 1
      @last_year.transfer_m_11 = '送金済'
      @last_year.save
    elsif @month == 2
      @last_year.transfer_m_12 = '送金済'
      @last_year.save
    elsif @month == 3
      @check_year.transfer_m_1 = '送金済'
      @check_year.save
    elsif @month == 4
      @check_year.transfer_m_2 = '送金済'
      @check_year.save
    elsif @month == 5
      @check_year.transfer_m_3 = '送金済'
      @check_year.save
    elsif @month == 6
      @check_year.transfer_m_4 = '送金済'
      @check_year.save
    elsif @month == 7
      @check_year.transfer_m_5 = '送金済'
      @check_year.save
    elsif @month == 8
      @check_year.transfer_m_6 = '送金済'
      @check_year.save
    elsif @month == 9
      @check_year.transfer_m_7 = '送金済'
      @check_year.save
    elsif @month == 10
      @check_year.transfer_m_8 = '送金済'
      @check_year.save
    elsif @month == 11
      @check_year.transfer_m_9 = '送金済'
      @check_year.save
    else
      @check_year.transfer_m_10 = '送金済'
      @check_year.save
    end
  end
  
  def bonus_ud
    time = Time.zone.now
    @year = time.year
    @month = time.month
    if @year == 2018
      bonus_ud_sub
    elsif @year == 2019
      bonus_ud_sub
    elsif @year == 2020
      bonus_ud_sub
    elsif @year == 2021
      bonus_ud_sub
    elsif @year == 2022
      bonus_ud_sub
    elsif @year == 2023
      bonus_ud_sub
    elsif @year == 2024
      bonus_ud_sub
    elsif @year == 2025
      bonus_ud_sub
    elsif @year == 2026
      bonus_ud_sub
    else
      if @year == 2019
        bonus_ud_sub
      end
    end
  end
  
  def bonus_ud_sub
    if @month == 4
      @check_year.transfer_c_1 = '送金済'
      @check_year.save
    elsif @month == 7
      @check_year.transfer_c_2 = '送金済'
      @check_year.save
    elsif @month == 10
      @check_year.transfer_c_3 = '送金済'
      @check_year.save
    else
      if @month == 1
        @last_year.transfer_c_4 = '送金済'
        @last_year.save
      end
    end
  end
  
  def sp_ud
    time = Time.zone.now
    @year = time.year
    @month = time.month
    if @year == 2018
      sp_ud_sub
    elsif @year == 2019
      sp_ud_sub
    elsif @year == 2020
      sp_ud_sub
    elsif @year == 2021
      sp_ud_sub
    elsif @year == 2022
      sp_ud_sub
    elsif @year == 2023
      sp_ud_sub
    elsif @year == 2024
      sp_ud_sub
    elsif @year == 2025
      sp_ud_sub
    elsif @year == 2026
      sp_ud_sub
    else
      if @year == 2027
        sp_ud_sub
      end
    end
  end
  
  def sp_ud_sub
    if @month == 1
      @last_year.sp_transfer_12 = '送金済'
      @last_year.save
    elsif @month == 2
      @check_year.sp_transfer_1 = '送金済'
      @check_year.save
    elsif @month == 3
      @check_year.sp_transfer_2 = '送金済'
      @check_year.save
    elsif @month == 4
      @check_year.sp_transfer_3 = '送金済'
      @check_year.save
    elsif @month == 5
      @check_year.sp_transfer_4 = '送金済'
      @check_year.save
    elsif @month == 6
      @check_year.sp_transfer_5 = '送金済'
      @check_year.save
    elsif @month == 7
      @check_year.sp_transfer_6 = '送金済'
      @check_year.save
    elsif @month == 8
      @check_year.sp_transfer_7 = '送金済'
      @check_year.save
    elsif @month == 9
      @check_year.sp_transfer_8 = '送金済'
      @check_year.save
    elsif @month == 10
      @check_year.sp_transfer_9 = '送金済'
      @check_year.save
    elsif @month == 11
      @check_year.sp_transfer_10 = '送金済'
      @check_year.save
    else
      @check_year.sp_transfer_11 = '送金済'
      @check_year.save
    end
  end
  
  def bonus_confirm
    time = Time.zone.now
    @year = time.year
    @month = time.month
   
    #$quarter20 = 20
    
    if @month <= 3  #現在のクオーター
      @quarter = 1
    elsif @month <= 6
      @quarter = 2
    elsif @month <= 9
      @quarter = 3
    else
      @quarter = 4
    end 
    
    if @year == 2018
      @check_year = Eighteen
      bonus_decision_sub
    
    elsif @year == 2019
      @check_year = Nineteen
      bonus_decision_sub
      
    elsif @year == 2020
      @check_year = Twentie
      bonus_decision_sub
      
    elsif @year == 2021
      @check_year = One
      bonus_decision_sub
      
    elsif @year == 2022
      @check_year = TwentyTwo
      bonus_decision_sub
      
    elsif @year == 2023
      @check_year = TwentyThree
      bonus_decision_sub
      
    elsif @year == 2024
      @check_year = TwentyFour
      bonus_decision_sub
      
    elsif @year == 2025
      @check_year = TwentyFive
      bonus_decision_sub
      
    elsif @year == 2026
      @check_year = TwentySix
      bonus_decision_sub
      
    else
      if @year == 2027
        @check_year = TwentySeven
        bonus_decision_sub
      end
    end
  end
  
  def bonus_decision_sub
    if @quarter == 1
      @quarter2 = 1
      @bonus_pay = '4月末'
      @bonus_member = @check_year.where("c_1 > 0").page(params[:page])
      @total_bonus_pay = @check_year.sum("c_1")
    elsif @quarter == 2
      @quarter2 = 2
      @bonus_pay = '7月末'
      @bonus_member = @check_year.where("c_2 > 0").page(params[:page])
      @total_bonus_pay = @check_year.sum("c_2")
    elsif @quarter == 3
      @quarter2 = 3
      @bonus_pay = '10月末'
      @bonus_member = @check_year.where("c_3 > 0").page(params[:page])
      @total_bonus_pay = @check_year.sum("c_3")
    else
      @quarter2 = 4
      @bonus_pay = '1月末'
      @bonus_member = @check_year.where("c_4 > 0").page(params[:page])
      @total_bonus_pay = @check_year.sum("c_4")
    end
  end
end
