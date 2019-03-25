class Admin::ChoicesController < Admin::Base
  def show
    @choice = current_administrator
    @choice = Choice.find_by(cutomer_id: current_administrator.id)
  end
  
  def edit
    @choice_form = Admin::ChoiceForm.new(Choice.find(1))
  end
  
  def update
    @choice_form = Admin::ChoiceForm.new(Choice.find(1))
    @Choice_form.assign_attributes(params[:form])
    if @choice_form.save
      flash.notice = '報酬検索条件を更新しました。'
      redirect_to :payment_list_admin_record
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
