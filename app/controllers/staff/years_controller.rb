class Staff::YearsController < Staff::Base
  def show
    @pay = current_staff_member
    @pay = Year.find(1)
  end
  
  def edit
    @year_form = Staff::YearForm.new(Year.find(1))
  end
  
  def update
    @year_form = Staff::YearForm.new(Year.find(1))
    @year_form.assign_attributes(params[:form])
    if @year_form.save
      flash.notice = '検索した年度の成績です。'
      redirect_to :staff_customers
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
