class Staff::StaffQuartersController < Staff::Base
  def show
    @pay = current_staff_member
    @pay = StaffQuarter.find(1)
  end
  
  def edit
    @staff_quarter_form = Staff::StaffQuarterForm.new(StaffQuarter.find(1))
  end
  
  def update
    @staff_quarter_form = Staff::StaffQuarterForm.new(StaffQuarter.find(1))
    @staff_quarter_form.assign_attributes(params[:form])
    if @staff_quarter_form.save
      flash.notice = '検索した年度/クオーターの成績です。'
      redirect_to :quarter_bonus_staff_record
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
