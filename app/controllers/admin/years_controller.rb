class Admin::YearsController < Admin::Base
  def show
    @pay = current_administrator
    @pay = Year.find_by(cutomer_id: current_administrator.id)
  end
  
  def edit
    @year_form = Admin::YearForm.new(Year.find(1))
  end
  
  def update
    @year_form = Admin::YearForm.new(Year.find(1))
    @year_form.assign_attributes(params[:form])
    if @year_form.save
      flash.notice = '検索した年度の成績です。'
      redirect_to :admin_customers
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
