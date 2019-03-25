class Customer::AccountsController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    @acc_name = @customer.family_name + ' ' + @customer.given_name  
    @acc_name_kana = @customer.family_name_kana + ' ' + @customer.given_name_kana
  end
  
  def edit
    @customer_form = Customer::AccountForm.new(current_customer)
  end

  # PATCH
  def confirm
    @customer_form = Customer::AccountForm.new(current_customer)
    @customer_form.assign_attributes(params[:form])
    if @customer_form.valid?
      render action: 'confirm'
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  def update
    @customer_form = Customer::AccountForm.new(current_customer)
    @customer_form.assign_attributes(params[:form])
    if params[:commit]
      if @customer_form.save
        flash.notice = 'アカウント情報を更新しました。'
        redirect_to :customer_account
      else
        flash.now.alert = '入力に誤りがあります。'
        render action: 'edit'
      end
    else
      render action: 'edit'
    end
  end
  
  private
  def customer_params
    @params.permit(customer: [:email, :family_name, :given_name, :family_name_kana, :given_name_kana, :birthday, :gender, :nickname, :sponsor1])
  end

  def home_address_params
    @params.permit(home_address: [:home_address, :postal_code, :prefecture, :city, :address1, :address2])
  end
  
  def phone_params(record_name)
    @params.require(record_name).permit(phones: [ :number, :primary ])
  end
end
