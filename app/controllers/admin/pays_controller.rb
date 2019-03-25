class Admin::PaysController < Admin::Base
  def show
    @pay = current_administrator
    @pay = Pay.find_by(cutomer_id: current_administrator.id)
  end
  
  def edit
    @pay_form = Admin::PayForm.new(Pay.find(1))
  end
  
  def update
    @pay_form = Admin::PayForm.new(Pay.find(1))
    @pay_form.assign_attributes(params[:form])
    if @pay_form.save
      flash.notice = '検索したキャッシュバック、ボーナス, 特別会員ボーナス獲得者です。'
      redirect_to :acquisition_member_admin_record
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
