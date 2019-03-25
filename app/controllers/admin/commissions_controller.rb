class Admin::CommissionsController < Admin::Base
  def index
    @commissions = Commission.order(:id)
  end
  
  def show
    @commission = Commission.find(params[:id])
  end
  
  def new
    @commission_form = Admin::CommissionForm.new
  end
  
  def edit
    @commission_form = Admin::CommissionForm.new(Commission.find(params[:id]))
    comm = Commission.find(params[:id])
    @bank_name = comm.bank_name
  end
  
  def create
    @commission_form = Admin::CommissionForm.new
    @commission_form.assign_attributes(params[:form])
    if @commission_form.save
      flash.notice = '振込み手数料情報を追加しました。'
      redirect_to action: 'index'
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end
  
  def update
    @commission_form = Admin::CommissionForm.new(Commission.find(params[:id]))
    @commission_form.assign_attributes(params[:form])
    if @commission_form.save
      flash.notice = '振込み手数料情報を更新しました。'
      redirect_to action: 'index'
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  def destroy
    commission = Commission.find(params[:id])
    commission.destroy!
    flash.notice = '振込み手数料情報を削除しました。'
    redirect_to :admin_commissions
  end
end
