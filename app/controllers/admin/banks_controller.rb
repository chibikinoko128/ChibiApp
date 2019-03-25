class Admin::BanksController < Admin::Base
  def show
    @bank = current_customer
    @bank = Bank.find_by(customer_id: current_customer.id)
  end
  
  def edit
    @customer = Customer.find(params[:id])
    time = Time.zone.now
    @month = time.month
    @bank_form = Admin::BankForm.new(Bank.find_by(customer_id: params[:id]))
    @customer = Customer.find(params[:id])
    @acc_name = @customer.family_name + ' ' + @customer.given_name  
    @acc_name_kana = @customer.family_name_kana + ' ' + @customer.given_name_kana
    @nickname = @customer.nickname
  end
  
  def update
    @bank_form = Admin::BankForm.new(Bank.find_by(customer_id: params[:id]))
    @bank_form.assign_attributes(params[:form])
    if @bank_form.save
      flash.notice = '口座情報を更新しました。'
      redirect_to :admin_customers
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  def account_change
    abc = Bank.find_by(customer_id: params[:bank_id])
    abc.bk_name_check = abc.bk_name
    abc.office_check = abc.office
    abc.account_check = abc.account
    abc.web_registration = "登録済み"
    abc.save
    flash.notice = 'WEB総振登録口座を更新しました。'
    redirect_to :admin_root
  end
  
  def not_account
    user = Customer.find_by(id: params[:bank_id])
    flash.notice = '登録口座の誤りを指摘しました。'
    redirect_to :payment_list_admin_record
    AccountMailer.not_account(user).deliver_now
  end
end
