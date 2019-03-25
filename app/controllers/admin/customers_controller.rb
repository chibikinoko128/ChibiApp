class Admin::CustomersController < Admin::Base
  def index
    logger.debug customer_params
    @search_form = Admin::CustomerSearchForm.new(customer_params[:search])
    @customers = @search_form.search.page(params[:page])
    time = Time.zone.now
    @month = time.month
    
    unsub_register
   
    @customer_ids = (Customer.ids - @unsub).count
    @special_member = Customer.where(member_type: "特別会員")
  end
  
  def show
    time = Time.zone.now
    @now_month = time.month
    @now_year = time.year
    @customer = Customer.find(params[:id])
    nick = @customer.nickname
    @acc_name = @customer.family_name + ' ' + @customer.given_name  
    @acc_name_kana = @customer.family_name_kana + ' ' + @customer.given_name_kana
    check = Year.find(1)
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
      @year_point = TwentyFpur
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
    @customer_form = Admin::CustomerForm.new
  end
  
  def edit
    @customer_form = Admin::CustomerForm.new(Customer.find(params[:id]))
  end
  
  def create
    @customer_form = Admin::CustomerForm.new
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
    time = Time.zone.now
    @year_now = time.year
    @next_year_now = @year_now + 1
    @month_now = time.month
    pay = Pay.find(1)
    @year = pay.year
    @next_year = @year + 1
    @month = pay.month
    @quarter = pay.quarter
    @customer_form = Admin::CustomerForm.new(Customer.find(params[:id]))
    @customer_form.assign_attributes(params[:form])
    
    @customer = Customer.find(params[:id])
    if @year == 2018
      @year_point = Eighteen.find(params[:id])
      month_decision
    elsif @year == 2019
      @year_point = Nineteen.find(params[:id])
      month_decision
    elsif @year == 2020
      @year_point = Twentie.find(params[:id])
      month_decision
    elsif @year == 2021
      @year_point = One.find(params[:id])
      month_decision
    elsif @year == 2022
      @year_point = TwentyTwo.find(params[:id])
      month_decision
    elsif @year == 2023
      @year_point = TwentyThree.find(params[:id])
      month_decision
    elsif @year == 2024
      @year_point = TwentyFour.find(params[:id])
      month_decision
    elsif @year == 2025
      @year_point = TwentyFive.find(params[:id])
      month_decision
    elsif @year == 2026
      @year_point = TwentySix.find(params[:id])
      month_decision
    else
      if @year == 2027
        @year_point = TwentySeven.find(params[:id])
        month_decision
      end
    end
    
    if @customer_form.save
      flash.notice = '顧客情報を更新しました。'
      cus = Customer.find(params[:id])
      spo = Sponsor.find(params[:id])
      if cus.sponsor1 == spo.sponsor1
      else
        spo.sponsor1 = cus.sponsor1
        spo.save
      end
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
    redirect_to :admin_customers
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
    
  def month_decision
    if @customer.lock == "0"
      if @month == 1
        if @year != @year_now
        elsif @month_now >= 4
        else
          @year_point.transfer_m_1 = "未送金"
          @year_point.cache_payment_1 = "未送金"
        end
      elsif @month == 2
        if @year != @year_now
        elsif @month_now >= 5
        else
          @year_point.transfer_m_2 = "未送金"
          @year_point.cache_payment_2 = "未送金"
        end
      elsif @month == 3
        if @year != @year_now
        elsif @month_now >= 6
        else
          @year_point.transfer_m_3 = "未送金"
          @year_point.cache_payment_3 = "未送金"
        end
      elsif @month == 4
        if @year != @year_now
        elsif @month_now >= 7
        else
          @year_point.transfer_m_4 = "未送金"
          @year_point.cache_payment_4 = "未送金"
        end
      elsif @month == 5
        if @year != @year_now
        elsif @month_now >= 8
        else
          @year_point.transfer_m_5 = "未送金"
          @year_point.cache_payment_5 = "未送金"
        end
      elsif @month == 6
        if @year != @year_now
        elsif @month_now >= 9
        else
          @year_point.transfer_m_6 = "未送金"
          @year_point.cache_payment_6 = "未送金"
        end
      elsif @month == 7
        if @year != @year_now
        elsif @month_now >= 10
        else
          @year_point.transfer_m_7 = "未送金"
          @year_point.cache_payment_7 = "未送金"
        end
      elsif @month == 8
        if @year != @year_now
        elsif @month_now >= 11
        else
          @year_point.transfer_m_8 = "未送金"
          @year_point.cache_payment_8 = "未送金"
        end
      elsif @month == 9
        if @year != @year_now
        elsif @month_now >= 12
        else
          @year_point.transfer_m_9 = "未送金"
          @year_point.cache_payment_9 = "未送金"
        end
      elsif @month == 10
        if @year != @year_now
        else
          @year_point.transfer_m_10 = "未送金"
          @year_point.cache_payment_10 = "未送金"
        end
      elsif @month == 11
        if @next_year != @next_year_now
        elsif @month_now >= 2
        else
          @year_point.transfer_m_11 = "未送金"
          @year_point.cache_payment_11 = "未送金"
        end
      else
        if @next_year != @next_year_now
        elsif @month_now >= 3
        else
          @year_point.transfer_m_12 = "未送金"
          @year_point.cache_payment_12 = "未送金"
        end
      end
    end
    
    if @customer.bonus_lock == "0"
      if @quarter == 1
        if @year != @year_now
        elsif @month_now >= 5 
          @year_point.transfer_c_1 == "未送金"
          @year_point.bonus_payment_1 = "未送金"
        end
      elsif @quarter == 2
        if @year != @year_now
        elsif @month_now >= 8 
          @year_point.transfer_c_2 == "未送金"
          @year_point.bonus_payment_2 = "未送金"
        end
      elsif @quarter == 3
        if @year != @year_now
        elsif @month_now >= 11 
          @year_point.transfer_c_3 == "未送金"
          @year_point.bonus_payment_3 = "未送金"
        end
      else
        if @next_year != @next_year_now
        elsif @month_now >= 2 
          @year_point.transfer_c_4 == "未送金"
          @year_point.bonus_payment_4 = "未送金" 
        end
      end
    end
    
    if @customer.special_lock == "0"
      if @month == 1
        if @year != @year_now
        elsif @month_now >= 4
        else
          @year_point.sp_transfer_1 = "未送金"
          @year_point.special_payment_1 = "未送金"
        end
      elsif @month == 2
        if @year != @year_now
        elsif @month_now >= 5
        else
          @year_point.sp_transfer_2 = "未送金"
          @year_point.special_payment_2 = "未送金"
        end
      elsif @month == 3
        if @year != @year_now
        elsif @month_now >= 6
        else
          @year_point.sp_transfer_3 = "未送金"
          @year_point.special_payment_3 = "未送金"
        end
      elsif @month == 4
        if @year != @year_now
        elsif @month_now >= 7
        else
          @year_point.sp_transfer_4 = "未送金"
          @year_point.special_payment_4 = "未送金"
        end
      elsif @month == 5
        if @year != @year_now
        elsif @month_now >= 8
        else
          @year_point.sp_transfer_5 = "未送金"
          @year_point.special_payment_5 = "未送金"
        end
      elsif @month == 6
        if @year != @year_now
        elsif @month_now >= 9
        else
          @year_point.sp_transfer_6 = "未送金"
          @year_point.special_payment_6 = "未送金"
        end
      elsif @month == 7
        if @year != @year_now
        elsif @month_now >= 10
        else
          @year_point.sp_transfer_7 = "未送金"
          @year_point.special_payment_7 = "未送金"
        end
      elsif @month == 8
        if @year != @year_now
        elsif @month_now >= 11
        else
          @year_point.sp_transfer_8 = "未送金"
          @year_point.special_payment_8 = "未送金"
        end
      elsif @month == 9
        if @year != @year_now
        elsif @month_now >= 12
        else
          @year_point.sp_transfer_9 = "未送金"
          @year_point.special_payment_9 = "未送金"
        end
      elsif @month == 10
        if @year != @year_now
        else
          @year_point.sp_transfer_10 = "未送金"
          @year_point.special_payment_10 = "未送金"
        end
      elsif @month == 11
        if @next_year != @next_year_now
        elsif @month_now >= 2
        else
          @year_point.sp_transfer_11 = "未送金"
          @year_point.special_payment_11 = "未送金"
        end
      else
        if @next_year != @next_year_now
        elsif @month_now >= 3
        else
          @year_point.sp_transfer_12 = "未送金"
          @year_point.special_payment_12 = "未送金"
        end
      end
    end   
    @year_point.save
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
