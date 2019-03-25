class TotalMember
  def self.enrollment_member
    time = Time.zone.now
    year = time.year
    @month = time.month
    
    if year == 2018
      @year_member = EighteenMember.find(1)
      enrollment_member_sub
    elsif year == 2019
      @year_member = NineteenMember.find(1)
      enrollment_member_sub
    elsif year == 2020
      @year_member = TwentieMember.find(1)
      enrollment_member_sub
    elsif year == 2021
      @year_member = OneMember.find(1)
      enrollment_member_sub
    elsif year == 2022
      @year_member = TwentyTwoMember.find(1)
      enrollment_member_sub
    elsif year == 2023
      @year_member = TwentyThreeMember.find(1)
      enrollment_member_sub
    elsif year == 2024
      @year_member = TwentyFourMember.find(1)
      enrollment_member_sub
    elsif year == 2025
      @year_member = TwentyFiveMember.find(1)
      enrollment_member_sub
    elsif year == 2026
      @year_member = TwentySixMember.find(1)
      enrollment_member_sub
    else
      if year == 2027
        @year_member = TwentySevenMember.find(1)
        enrollment_member_sub
      end
    end
  end
    
  def self.enrollment_member_sub 
    if @month == 1
      register_count = Register.where(rg_1: "在籍").count
      @year_member.om_1 = register_count
    elsif @month == 2
      register_count = Register.where(rg_2: "在籍").count
      @year_member.om_2 = register_count
    elsif @month == 3
      register_count = Register.where(rg_3: "在籍").count
      @year_member.om_3 = register_count
    elsif @month == 4
      register_count = Register.where(rg_4: "在籍").count
      @year_member.om_4 = register_count
    elsif @month == 5
      register_count = Register.where(rg_5: "在籍").count
      @year_member.om_5 = register_count
    elsif @month == 6
      register_count = Register.where(rg_6: "在籍").count
      @year_member.om_6 = register_count
    elsif @month == 7
      register_count = Register.where(rg_7: "在籍").count
      @year_member.om_7 = register_count
    elsif @month == 8
      register_count = Register.where(rg_8: "在籍").count
      @year_member.om_8 = register_count
    elsif @month == 9
      register_count = Register.where(rg_9: "在籍").count
      @year_member.om_9 = register_count
    elsif @month == 10
      register_count = Register.where(rg_10: "在籍").count
      @year_member.om_10 = register_count
    elsif @month == 11
      register_count = Register.where(rg_11: "在籍").count
      @year_member.om_11 = register_count
    else
      register_count = Register.where(rg_12: "在籍").count
      @year_member.om_12 = register_count
    end
    @year_member.save
  end
end
        
    
    
    
    
      