class Admin::TopController < Admin::Base
  skip_before_action :authorize
  
  def index
    if current_administrator
      render action: 'dashboard'
      if Choice.ids.empty?
        eighteen_member = EighteenMember.new
        eighteen_member.save
        
        nineteen_member = NineteenMember.new
        nineteen_member.save
        
        twentie_member = TwentieMember.new
        twentie_member.save
        
        one_member = OneMember.new
        one_member.save
        
        twenty_two_member = TwentyTwoMember.new
        twenty_two_member.save
        
        twenty_three_member = TwentyThreeMember.new
        twenty_three_member.save
        
        twenty_four_member = TwentyFourMember.new
        twenty_four_member.save
        
        twenty_five_member = TwentyFiveMember.new
        twenty_five_member.save
        
        twenty_six_member = TwentySixMember.new
        twenty_six_member.save
        
        twenty_seven_member = TwentySevenMember.new
        twenty_seven_member.save
        
        retrieval = Retrieval.new
        retrieval.save
        
        pay = Pay.new
        pay.save
        
        staff_year = StaffYear.new
        staff_year.save
        
        staff_month = StaffMonth.new
        staff_month.save
        
        staff_quarter = StaffQuarter.new
        staff_quarter.save
        
        year = Year.new
        year.save
        
        admission = Admission.new
        admission.save
        
        margin = Margin.new
        margin.save
        
        number = Number.new
        number.save
        
        choice = Choice.new
        choice.save
      end
    else
      render action: 'index'
    end
  end
end
