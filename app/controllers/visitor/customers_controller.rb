class Visitor::CustomersController < Visitor::Base
  def index
    logger.debug customer_params
    @search_form = Visitor::CustomerSearchForm.new(customer_params[:search])
    @customers = @search_form.search.page(params[:page])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def new
    @customer_form = Visitor::CustomerForm.new    
  end
  
  def edit
    @customer_form = Visitor::CustomerForm.new(Customer.find(params[:id]))
  end
  
  def create
    @time = Time.zone.now
    @month = @time.month
    if @month >= 4
      @month_1 = @month - 1
      @month_2 = @month - 2
      @month_3 = @month - 3
    elsif @month == 3
      @month_1 = 2
      @month_2 = 1
      @month_3 = 12
    elsif @month == 2
      @month_1 = 1
      @month_2 = 12
      @month_3 = 11
    else
      @month_1 = 12
      @month_2 = 11
      @month_3 = 10
    end
    
    @customer_form = Visitor::CustomerForm.new
    @customer_form.assign_attributes(params[:form])
    @change = @customer_form.customer
    
    x = @customer_form.customer.home_address
    @h = x.prefecture
    @i = x.city
    
    @o = @change.family_name
    @p = @change.given_name
    @q = @change.birthday
    
    if @i =~ /市$/
      city_crear
    elsif @i =~ /区$/
      city_crear
    elsif @i =~ /町$/
      city_crear
    elsif @i =~ /村$/
      city_crear
    else
      flash.now.alert = '市、区、町、村のみ入力してください。'
      render action: 'new' and return
    end
  end
    
  def update
    @customer_form = Visitor::CustomerForm.new(Customer.find(params[:id]))
    @customer_form.assign_attributes(params[:form])
    if @customer_form.save
      flash.notice = '顧客情報を更新しました。'
      redirect_to action: 'index'
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy!
    flash.notice = '顧客アカウントを削除しました。'
    redirect_to :visitor_customers
  end
  
  def move_now
    render action: 'move_now' and return
  end
  
  def move_on
    render action: 'move_on' and return
  end
  
  def not_payment
    render action: 'not_payment' and return
  end
      
  def city_crear
    @customer_1 = Customer.where(family_name: @o).where(given_name: @p).where(birthday: @q).pluck(:id)
    if @customer_1.present?  #氏名、生年月日が一致したレコードがあれば
      @customer_1.each do |w|
        @h_address = HomeAddress.find_by(customer_id: w) #住所を取得
        if @h_address.present? #住所が一致したレコードがあれば
          if @h_address.prefecture + @h_address.city == @h + @i
            register = Register.find_by(customer_id: w)
            sub_check = register.rg_1 + register.rg_2 + register.rg_3 + register.rg_4 + register.rg_5 + register.rg_6 + register.rg_7 + register.rg_8 + register.rg_9 + register.rg_10 + register.rg_11 + register.rg_12
            @customer_2 = Customer.find_by(id: w)
            what_ago = @customer_2.created_at      #登録日を取得
            one_what_ago = what_ago.years_since(1) #登録された日から１年後の日付

            if @time > one_what_ago #登録してから１年経過していれば
              reg_success #登録許可
            elsif register["rg_#{@month}"] == "在籍" #１年経過してなく今月在籍ならば
              move_now
            elsif register["rg_#{@month_1}"] == "在籍" #１年経過してなく先月在籍ならば
              if @month <= 9
                @month_4 = @month + 3
              elsif @month == 10
                @month_4 = 1
              elsif @month == 11
                @month_4 = 2
              else
                @month_4 = 3
              end
              move_on
            elsif register["rg_#{@month_2}"] == "在籍" #１年経過してなく先々月在籍ならば
              if @month <= 10
                @month_4 = @month + 2
              elsif @month == 11
                @month_4 = 1
              else
                @month_4 = 2
              end
              move_on
            elsif register["rg_#{@month_3}"] == "在籍" #１年経過してなく先々々月在籍ならば
              if @month <= 11
                @month_4 = @month + 1
              else
                @month_4 = 1
              end
              move_on
            elsif sub_check =~ /在籍/ #１年以内に在籍履歴があれば新規登録許可
              reg_success
            else #１年間在籍履歴がなければ
              not_payment
            end 
          else #氏名、生年月日が一致していなければ新規登録許可
            reg_success
          end
        else #氏名、生年月日が一致していなければ新規登録許可
          reg_success
        end
      end
    else #氏名、生年月日が一致していなければ新規登録許可
      reg_success
    end
  end

  def reg_success
    @customer_form = Visitor::CustomerForm.new
    @customer_form.assign_attributes(params[:form])
    @change = @customer_form.customer
    if @customer_form.save
      if @change.sponsor1 == 'sss'
        @change.sponsor1 = 'dragon'
        @change.save
      end
      flash.notice = '顧客情報を新規に登録しました。'
      redirect_to :visitor_root
      
      user = @customer_form.customer
      ThanksMailer.thank_you(user).deliver_now
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new' and return
    end
  end
  
  private
  def customer_params
    params.permit(search: [
      :family_name_kana, :given_name_kana,
      :birth_year, :birth_month, :birth_mday,
      :address_type, :prefecture,
      :city, :phone_number]
    )
  end
end
