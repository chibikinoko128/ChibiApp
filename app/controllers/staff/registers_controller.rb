class Staff::RegistersController < Staff::Base
  def show
    @register = current_customer
    @register = Register.find_by(customer_id: current_customer.id)
  end
  
  def edit
    time = Time.zone.now
    @month = time.month
    
    if @month == 11
      @next_month = 12
      @two_month_later = 1
    elsif @month == 12
      @next_month = 1
      @two_month_later = 2
    else
      @next_month = @month + 1
      @two_month_later = @month + 2
    end
    
    @customer = Customer.find(params[:id])
    @register = Register.find(params[:id])
    s = @customer.email
    if s =~ /^exit/
      render action: 'out'
    elsif @register["rg_#{@month}"] == "在籍"
      render action: 'out'
    elsif @register["rg_#{@next_month}"] == "在籍"
      render action: 'out'
    elsif @register["rg_#{@two_month_later}"] == "在籍"
      render action: 'out'
    else
      @register_form = Staff::RegisterForm.new(Register.find_by(customer_id: params[:id]))
      @customer = Customer.find(params[:id])
      @acc_name = @customer.family_name + ' ' + @customer.given_name  
      @acc_name_kana = @customer.family_name_kana + ' ' + @customer.given_name_kana
      @nickname = @customer.nickname
    end
  end
  
  def update
    @register_form = Staff::RegisterForm.new(Register.find_by(customer_id: params[:id]))
    @register_form.assign_attributes(params[:form])
    if @register_form.save
      flash.notice = '在籍有無を更新しました。'
      redirect_to :staff_customers
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
