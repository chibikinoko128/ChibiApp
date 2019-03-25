class Staff::StaffYearsController < Staff::Base
  def show
    @pay = current_staff_member
    @pay = StaffYear.find(1)
  end
  
  def edit
    @staff_year_form = Staff::StaffYearForm.new(StaffYear.find(1))
  end
  
  def update
    @staff_year_form = Staff::StaffYearForm.new(StaffYear.find(1))
    @staff_year_form.assign_attributes(params[:form])
    if @staff_year_form.save
      flash.notice = '検索した年度の成績です。'
      redirect_to :staff_customers
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end


