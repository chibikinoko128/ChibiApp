class Staff::StaffMonthsController < Staff::Base
  def show
    @pay = current_staff_member
    @pay = StaffMonth.find(1)
  end
  
  def edit
    @staff_month_form = Staff::StaffMonthForm.new(StaffMonth.find(1))
  end
  
  def update
    @staff_month_form = Staff::StaffMonthForm.new(StaffMonth.find(1))
    @staff_month_form.assign_attributes(params[:form])
    if @staff_month_form.save
      flash.notice = '検索した年度/月の成績です。'
      redirect_to :cash_back_staff_record
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
