class MonthRecord
  def self.member_count
    time = Time.zone.now
    @year = time.year
    @month = time.month
   
    if @year == 2018
      @month_member_total = EighteenMember.find(1)
      member_count_sub
    elsif @year == 2019
      @month_member_total = NineteenMember.find(1)
      member_count_sub
    elsif @year == 2020
      @month_member_total = TwentieMember.find(1)
      member_count_sub
    elsif @year == 2021
      @month_member_total = OneMember.find(1)
      member_count_sub
    elsif @year == 2022
      @month_member_total = TwentyTwoMember.find(1)
      member_count_sub
    elsif @year == 2023
      @month_member_total = TwentyThreeMember.find(1)
      member_count_sub
    elsif @year == 2024
      @month_member_total = TwentyFourMember.find(1)
      member_count_sub
    elsif @year == 2025
      @month_member_total = TwentyFiveMember.find(1)
      member_count_sub
    elsif @year == 2026
      @month_member_total = TwentySixMember.find(1)
      member_count_sub
    else
      if @year == 2027
        @month_member_total = TwentySevenMember.find(1)
        member_count_sub
      end
    end
  end
  
  def self.member_count_sub
    if @month == 1
      month_performance = Register.where(rg_12: "在籍").count
      @month_member_total.om_12 = month_performance
    elsif @month == 2
      month_performance = Register.where(rg_1: "在籍").count
      @month_member_total.om_1 = month_performance
    elsif @month == 3
      month_performance = Register.where(rg_2: "在籍").count
      @month_member_total.om_2 = month_performance
    elsif @month == 4
      month_performance = Register.where(rg_3: "在籍").count
      @month_member_total.om_3 = month_performance
    elsif @month == 5
      month_performance = Register.where(rg_4: "在籍").count
      @month_member_total.om_4 = month_performance
    elsif @month == 6
      month_performance = Register.where(rg_5: "在籍").count
      @month_member_total.om_5 = month_performance
    elsif @month == 7
      month_performance = Register.where(rg_6: "在籍").count
      @month_member_total.om_6 = month_performance
    elsif @month == 8
      month_performance = Register.where(rg_7: "在籍").count
      @month_member_total.om_7 = month_performance
    elsif @month == 9
      month_performance = Register.where(rg_8: "在籍").count
      @month_member_total.om_8 = month_performance
    elsif @month == 10
      month_performance = Register.where(rg_9: "在籍").count
      @month_member_total.om_9 = month_performance
    elsif @month == 11
      month_performance = Register.where(rg_10: "在籍").count
      @month_member_total.om_10 = month_performance
    else
      month_performance = Register.where(rg_11: "在籍").count
      @month_member_total.om_11 = month_performance
    end
    @month_member_total.save
  end
end