class Customer::BanksController < Customer::Base
  def show
    @bank = current_customer
    @bank = Bank.find_by(customer_id: current_customer.id)
  end
  
  def new
    @bank_form = Customer::BankForm.new
    @customer = Customer.find_by(id: current_customer.id)
    @acc_name = @customer.family_name + ' ' + @customer.given_name  
    @acc_name_kana = @customer.family_name_kana + ' ' + @customer.given_name_kana
  end
  
  def edit
    @bank_form = Customer::BankForm.new(Bank.find_by(customer_id: current_customer.id))
    @customer = Customer.find_by(id: current_customer.id)
    @acc_name = @customer.family_name + ' ' + @customer.given_name  
    @acc_name_kana = @customer.family_name_kana + ' ' + @customer.given_name_kana
  end
  
  # PATCH
  def confirm
    @bank_form = Customer::BankForm.new(Bank.find_by(customer_id: current_customer.id))
    @bank_form.assign_attributes(params[:form][:bank][:bk_name])
    @bank_form.assign_attributes(params[:form][:bank][:office])
    @bank_form.assign_attributes(params[:form][:bank][:account])
    @bank_form.assign_attributes(params[:form][:bank][:acc_name])
    @bank_form.assign_attributes(params[:form][:bank][:acc_name_kana])
    if @bank_form.valid?
      render action: 'confirm'
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  def create
    @customer = Customer.find_by(id: current_customer.id)
    @bank_form = Customer::BankForm.new
    @bank_form.assign_attributes(params[:form])
    if @bank_form.save
      flash.notice = '口座情報を登録しました。'
      redirect_to action: 'new'
    else
      flash.now.alert = '入力に誤りがあります。'
      render actionn: 'new'
    end
  end

  def update
    @bank_form = Customer::BankForm.new(Bank.find_by(customer_id: current_customer.id))
    @bank_form.assign_attributes(params[:form])
    if @bank_form.save
      flash.notice = '口座アカウントを更新/登録しました。'
      redirect_to :customer_root
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  private
  def bank_params
    @params.require(:bank).permit(:customer_id, :bk_name, :office, :account, :acc_name, :acc_name_kana)
  end
end
