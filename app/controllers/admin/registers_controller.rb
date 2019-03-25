class Admin::RegistersController < Admin::Base
  def show
    @register = current_customer
    @register = Register.find_by(customer_id: current_customer.id)
  end
  
  def edit
    @customer = Customer.find(params[:id])
    time = Time.zone.now
    @month = time.month
    @register_form = Admin::RegisterForm.new(Register.find_by(customer_id: params[:id]))
    @customer = Customer.find(params[:id])
    @acc_name = @customer.family_name + ' ' + @customer.given_name  
    @acc_name_kana = @customer.family_name_kana + ' ' + @customer.given_name_kana
    @nickname = @customer.nickname
  end
  
  def update
    @time = Time.zone.now
    @month = @time.month
    if @month == 1
      @last_month = 12
      @next_month = 2
    elsif @month == 12
      @last_month = 11
      @next_month = 1
    else
      @last_month = @time.month - 1
      @next_month = @time.month + 1
    end

    @register_form = Admin::RegisterForm.new(Register.find_by(customer_id: params[:id]))
    @register_form.assign_attributes(params[:form])
    if @register_form.save
      flash.notice = '在籍有無を更新しました。'
      reg = Register.find_by(customer_id: params[:id])
      
      if reg["rg_#{@last_month}"] == "退会"
        if reg["rg_#{@month}"] == "在籍"
          if reg["rg_#{@next_month}"] == "在籍"
            user = Customer.find_by(id: params[:id])
            RegisterMailer.new_payment(user).deliver_now
          end
        end
      else
        if reg["rg_#{@last_month}"] == "在籍"
          if reg["rg_#{@month}"] == "在籍"
            if reg["rg_#{@next_month}"] == "在籍"
              user = Customer.find_by(id: params[:id])
              RegisterMailer.next_payment(user).deliver_now
            elsif reg["rg_#{@month}"] == "在籍"
              user = Customer.find_by(id: params[:id])
              RegisterMailer.payment(user).deliver_now
            end
          end
        end
      end
      
      redirect_to :admin_customers
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end


