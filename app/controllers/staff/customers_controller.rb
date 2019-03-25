class Staff::CustomersController < Staff::Base
  def index
    check = StaffYear.find(1)
    @year_check = check.year_check
    logger.debug customer_params
    @search_form = Staff::CustomerSearchForm.new(customer_params[:search])
    @customers = @search_form.search.page(params[:page])
    time = Time.zone.now
    @month = time.month
  end
  
  def show
    @customer = Customer.find(params[:id])
    nick = @customer.nickname
    @acc_name = @customer.family_name + ' ' + @customer.given_name  
    @acc_name_kana = @customer.family_name_kana + ' ' + @customer.given_name_kana
    check = StaffYear.find(1)
    @year_check = check.year_check
    
    if @year_check == 2018
      @year_point = Eighteen
      year_point_check
    elsif @year_check == 2019
      @year_point = Nineteen
      year_point_check
    elsif @year_check == 2020
      @year_point = Twentie
      year_point_check
    elsif @year_check == 2021
      @year_point = One
      year_point_check
    elsif @year_check == 2022
      @year_point = TwentyTwo
      year_point_check
    elsif @year_check == 2023
      @year_point = TwentyThree
      year_point_check
    elsif @year_check == 2024
      @year_point = TwentyFour
      year_point_check
    elsif @year_check == 2025
      @year_point = TwentyFive
      year_point_check
    elsif @year_check == 2026
      @year_point = TwentySix
      year_point_check
    else
      if @year_check == 2027
        @year_point = TwentySeven
        year_point_check
      end
    end
  end
    
  def new
    @customer_form = Staff::CustomerForm.new
  end
  
  def edit
    @customer_form = Staff::CustomerForm.new(Customer.find(params[:id]))
  end
  
  def create
    @customer_form = Staff::CustomerForm.new
    @customer_form.assign_attributes(params[:form])
    if @customer_form.save
       change = @customer_form.customer
      if change.sponsor1 == 'sss'
        change.sponsor1 = 'dragon'
        change.save
      end
      flash.notice = '顧客を追加しました。'
      redirect_to action: 'index'
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end

  def update
    @customer_form = Staff::CustomerForm.new(Customer.find(params[:id]))
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
    redirect_to :staff_customers
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
  
  def unsub_register
    if @month == 1
      @unsub = Register.where(rg_1: "退会").pluck(:customer_id) 
    elsif @month == 2
      @unsub = Register.where(rg_2: "退会").pluck(:customer_id)
    elsif @month == 3
      @unsub = Register.where(rg_3: "退会").pluck(:customer_id)
    elsif @month == 4
      @unsub = Register.where(rg_4: "退会").pluck(:customer_id)
    elsif @month == 5
      @unsub = Register.where(rg_5: "退会").pluck(:customer_id)
    elsif @month == 6
      @unsub = Register.where(rg_6: "退会").pluck(:customer_id)
    elsif @month == 7
      @unsub = Register.where(rg_7: "退会").pluck(:customer_id)
    elsif @month == 8
      @unsub = Register.where(rg_8: "退会").pluck(:customer_id)
    elsif @month == 9
      @unsub = Register.where(rg_9: "退会").pluck(:customer_id)
    elsif @month == 10
      @unsub = Register.where(rg_10: "退会").pluck(:customer_id)
    elsif @month == 11
      @unsub = Register.where(rg_11: "退会").pluck(:customer_id)
    else
      @unsub = Register.where(rg_12: "退会").pluck(:customer_id)
    end
  end
  
  def year_point_check
    year = @year_point.find(params[:id])
    @sp_1 = year.pt_special_1
    @sp_2 = year.pt_special_2
    @sp_3 = year.pt_special_3
    @sp_4 = year.pt_special_4
    @sp_5 = year.pt_special_5
    @sp_6 = year.pt_special_6
    @sp_7 = year.pt_special_7
    @sp_8 = year.pt_special_8
    @sp_9 = year.pt_special_9
    @sp_10 = year.pt_special_10
    @sp_11 = year.pt_special_11
    @sp_12 = year.pt_special_12
    
    @total = @sp_1 + @sp_2 + @sp_3 + @sp_4 + @sp_5 + @sp_6 + @sp_7 + @sp_8 + @sp_9 + @sp_10 + @sp_11 + @sp_12 + year.m_1 + year.m_2 + year.m_3 + year.c_1 + year.m_4 + year.m_5 + year.m_6 + year.c_2 + year.m_7 + year.m_8 + year.m_9 + year.c_3 + year.m_10 + year.m_11 + year.m_12 + year.c_4
    
    @total_a = year.m_1 + year.m_2 + year.m_3 + year.c_1 + year.m_4 + year.m_5 + year.m_6 + year.c_2 + year.m_7 + year.m_8 + year.m_9 + year.c_3 + year.m_10 + year.m_11 + year.m_12 + year.c_4
  end
end
