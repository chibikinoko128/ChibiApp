class Customer::SessionsController < Customer::Base
  skip_before_action :authorize

  def new
    if current_customer
      redirect_to :customer_root
    else
      @form = Customer::LoginForm.new
      render action: 'new'
    end
  end

  def create
    time = Time.zone.now
    month = time.month
    @form = Customer::LoginForm.new(customer_login)
    if @form.email.present?
      mail = Customer.find_by(email_for_index: @form.email.downcase)
      if mail.present?
      else
        flash.now.alert = '入力値が正しくありません。'
        render action: 'new' and return
      end
    else
      flash.now.alert = 'メールアドレスを入力して下さい。'
      render action: 'new' and return
    end
    
    if @form.nickname.present?
      nickname = Customer.find_by(nickname: @form.nickname)
      if nickname.present?
        if mail.nickname == nickname.nickname
        else
          flash.now.alert = 'ニックネームまたはパスワードをを正しく入力してください。'
          render action: 'new' and return
        end
      else
        flash.now.alert = '入力値が正しくありません。'
        render action: 'new' and return
      end
    else
      flash.now.alert = 'ニックネームを入力して下さい。'
      render action: 'new' and return
    end
    
    register = Register.find_by(customer_id: nickname.id)
    data = register.attributes
    abc = data["rg_#{month}"]
    
    if abc == "在籍"  
      if Customer::Authenticator.new(mail).authenticate(@form.password)
        if @form.remember_me?
          cookies.permanent.signed[:customer_id] = mail.id
        else
          cookies.delete(:customer_id)
          session[:customer_id] = mail.id
        end
        flash.notice = 'ログインしました。'
        redirect_to :customer_root
      else
        flash.now.alert = 'ニックネームまたはパスワードをを正しく入力してください。'
        render action: 'new' and return
      end 
    else
      flash.now.alert = '退会しています。'
      render action: 'out'
    end
  end
    
  def destroy
    cookies.delete(:customer_id)
    session.delete(:customer_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :customer_root
  end
  
  def out
    render action: 'out'
  end
  
  private
  def customer_login
    params.require(:customer_login_form).permit(
      :email, :password, :nickname)
  end
end
