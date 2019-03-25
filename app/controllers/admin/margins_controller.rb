class Admin::MarginsController < Admin::Base
  def show
    @margin = current_administrator
    @margin = Margins.find_by(customer_id: current_administrator.id)
  end
  
  def edit
    @margin_form = Admin::MarginForm.new(Margin.find(1))
  end
  
  def update
    @margin_form = Admin::MarginForm.new(Margin.find(1))
    @margin_form.assign_attributes(params[:form])
    if @margin_form.save
      flash.notice = '現在の振込み手数料です。'
      redirect_to :month_margin_admin_margin
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  def month_margin
    @margin = Margin.find(1)
    @year = @margin.year
    @month = @margin.month
    commission = Commission.find_by(pay_bank: "振込")
    @bank_name = commission.bank_name
    @fee_low = commission.fee_low
    @fee_high = commission.fee_high
    time = Time.zone.now
    @now_year = time.year
    if @margin.year == 2018
      @check_year = Eighteen
      @last_check_year = Eighteen
      check_margin
      year_profits_record
    elsif @margin.year == 2019
      @check_year = Nineteen
      @last_check_year = Eighteen
      check_margin
      year_profits_record
    elsif @margin.year == 2020
      @check_year = Twentie
      @last_check_year = Nineteen
      check_margin
      year_profits_record
    elsif @margin.year == 2021
      @check_year = One
      @last_check_year = Twentie
      check_margin
      year_profits_record
    elsif @margin.year == 2022
      @check_year = TwentyTwo
      @last_check_year = One
      check_margin
      year_profits_record
    elsif @margin.year == 2023
      @check_year = TwentyThree
      @last_check_year = TwentyTwo
      check_margin
      year_profits_record
    elsif @margin.year == 2024
      @check_year = TwentyFour
      @last_check_year = TwentyThree
      check_margin
      year_profits_record
    elsif @margin.year == 2025
      @check_year = TwentyFive
      @last_check_year = TwentyFour
      check_margin
      year_profits_record
    elsif @margin.year == 2026
      @check_year = TwentySix
      @last_check_year = TwentyFive
      check_margin
      year_profits_record
    else
      if @margin.year == 2027
        @check_year = TwentySeven
        @last_check_year = TwentySix
        check_margin
        year_profits_record
      end
    end
  end
  
  def check_margin
    if @month == 1
      if @now_year != @margin.year
        unsub = @last_check_year.where("m_11 = 0").pluck(:customer_id)
        sp_unsub = @last_check_year.where("pt_special_12 = 0").pluck(:customer_id)
        b_unsub = @last_check_year.where("c_4 = 0").pluck(:customer_id)

        @margin_c_low = @last_check_year.where("m_11 < 30000").where.not(customer_id: [unsub]).count

        @margin_s_low = @last_check_year.where("pt_special_12 < 30000").where.not(customer_id: [sp_unsub]).count

        @margin_b_low = @last_check_year.where("c_4 < 30000").where.not(customer_id: [b_unsub]).count

        @margin_c_high = @last_check_year.where("m_11 >= 30000").count

        @margin_s_high = @last_check_year.where("pt_special_12 >= 30000").count

        @margin_b_high = @last_check_year.where("c_4 >= 30000").count

        @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      end
      @unsub = 0
    elsif @month == 2
      if @now_year != @margin.year
        unsub = @last_check_year.where("m_12 = 0").pluck(:customer_id)
        sp_unsub = @check_year.where("pt_special_1 = 0").pluck(:customer_id)

        @margin_c_low = @last_check_year.where("m_12 < 30000").where.not(customer_id: [unsub]).count

        @margin_s_low = @check_year.where("pt_special_1 < 30000").where.not(customer_id: [sp_unsub]).count

        @margin_c_high = @last_check_year.where("m_12 >= 30000").count

        @margin_s_high = @check_year.where("pt_special_1 >= 30000").count

        @margin_b_low = 0
        @margin_b_high = 0

        @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      end 
    elsif @month == 3
      unsub = @check_year.where("m_1 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_2 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_1 < 30000").where.not(customer_id: [unsub]).count
      
      @margin_s_low = @check_year.where("pt_special_2 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_c_high = @check_year.where("m_1 > 30000").count
      
      @margin_s_high = @check_year.where("pt_special_2 >= 30000").count
      
      @margin_b_low = 0
      @margin_b_high = 0
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    elsif @month == 4
      unsub = @check_year.where("m_2 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_3 = 0").pluck(:customer_id)
      b_unsub = @check_year.where("c_1 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_2 < 30000").where.not(customer_id: [unsub]).count
      
      @margin_s_low = @check_year.where("pt_special_3 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_b_low = @check_year.where("c_1 < 30000").where.not(customer_id: [b_unsub]).count
      
      @margin_c_high = @check_year.where("m_2 > 30000").count
      
      @margin_s_high = @check_year.where("pt_special_3 >= 30000").count
      
      @margin_b_high = @check_year.where("c_1 >= 30000").count
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    elsif @month == 5
      unsub = @check_year.where("m_3 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_4 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_3 < 30000").where.not(customer_id: [unsub]).count
      
      @margin_s_low = @check_year.where("pt_special_4 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_c_high = @check_year.where("m_3 >= 30000").count
      
      @margin_s_high = @check_year.where("pt_special_4 >= 30000").count
      
      @margin_b_low = 0
      @margin_b_high = 0
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    elsif @month == 6
      unsub = @check_year.where("m_4 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_5 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_4 < 30000").where.not(customer_id: [unsub]).count
      
      @margin_s_low = @check_year.where("pt_special_5 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_c_high = @check_year.where("m_4 >= 30000").count
      
      @margin_s_high = @check_year.where("pt_special_5 >= 30000").count
      
      @margin_b_low = 0
      @margin_b_high = 0
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    elsif @month == 7
      unsub = @check_year.where("m_5 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_6 = 0").pluck(:customer_id)
      b_unsub = @check_year.where("c_2 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_5 < 30000").where.not(customer_id: [unsub]).count
      
      @margin_s_low = @check_year.where("pt_special_6 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_b_low = @check_year.where("c_2 < 30000").where.not(customer_id: [b_unsub]).count
      
      @margin_c_high = @check_year.where("m_5 >= 30000").count
      
      @margin_s_high = @check_year.where("pt_special_6 >= 30000").count
      
      @margin_b_high = @check_year.where("c_2 >= 30000").count
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    elsif @month == 8
      unsub = @check_year.where("m_6 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_7 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_6 < 30000").where.not(customer_id: [unsub]).count
        
      @margin_s_low = @check_year.where("pt_special_7 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_c_high = @check_year.where("m_6 >= 30000").count
      
      @margin_s_high = @check_year.where("pt_special_7 >= 30000").count
      
      @margin_b_low = 0
      @margin_b_high = 0
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    elsif @month == 9
      unsub = @check_year.where("m_7 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_8 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_7 < 30000").where.not(customer_id: [unsub]).count
      
      @margin_s_low = @check_year.where("pt_special_8 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_c_high = @check_year.where("m_7 >= 30000").count
      
      @margin_s_high = @check_year.where("pt_special_8 >= 30000").count
      
      @margin_b_low = 0
      @margin_b_high = 0
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    elsif @month == 10
      unsub = @check_year.where("m_8 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_9 = 0").pluck(:customer_id)
      b_unsub = @check_year.where("c_3 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_8 < 30000").where.not(customer_id: [unsub]).count
      
      @margin_s_low = @check_year.where("pt_special_9 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_b_low = @check_year.where("c_3 < 30000").where.not(customer_id: [b_unsub]).count
      
      @margin_c_high = @check_year.where("m_8 >= 30000").count
      
      @margin_s_high = @check_year.where("pt_special_9 >= 30000").count
      
      @margin_b_high = @check_year.where("c_3 >= 30000").count
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    elsif @month == 11
      unsub = @check_year.where("m_9 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_10 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_9 < 30000").where.not(customer_id: [unsub]).count
      
      @margin_s_low = @check_year.where("pt_special_10 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_c_high = @check_year.where("m_9 >= 30000").count
      
      @margin_s_high = @check_year.where("pt_special_10 >= 30000").count
      
      @margin_b_low = 0
      @margin_b_high = 0
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    else
      unsub = @check_year.where("m_10 = 0").pluck(:customer_id)
      sp_unsub = @check_year.where("pt_special_11 = 0").pluck(:customer_id)
      
      @margin_c_low = @check_year.where("m_10 < 30000").where.not(customer_id: [unsub]).count
      
      @margin_s_low = @check_year.where("pt_special_11 < 30000").where.not(customer_id: [sp_unsub]).count
      
      @margin_c_high = @check_year.where("m_10 >= 30000").count
      
      @margin_s_high = @check_year.where("pt_special_11 >= 30000").count
      
      @margin_b_low = 0
      @margin_b_high = 0
      
      @unsub = @margin_c_low + @margin_s_low + @margin_c_high + @margin_s_high
      
    end
    
    if @now_year != @margin.year
      @margin_subtotal = @margin_c_low + @margin_s_low + @margin_b_low
      @margin_total = @margin_c_high + @margin_s_high + @margin_b_high
      @low_margin = @margin_subtotal * @fee_low
      @high_margin = @margin_total * @fee_high
      @total = @low_margin + @high_margin
      @margin_month = (@margin_subtotal * (700 - @fee_low)) + (@margin_total * (1000 - @fee_high))
    end
  end
  
  def year_profits_record
    #1月対象外
    unsub_m_11 = @last_check_year.where("m_11 = 0").pluck(:customer_id)
    sp_unsub_sp_12 = @last_check_year.where("pt_special_12 = 0").pluck(:customer_id)
    b_unsub_c_4 = @last_check_year.where("c_4 = 0").pluck(:customer_id)
    #2月対象外
    unsub_m_12 = @last_check_year.where("m_12 = 0").pluck(:customer_id)
    sp_unsub_sp_1 = @check_year.where("pt_special_1 = 0").pluck(:customer_id)
    #3月対象外
    unsub_m_1 = @check_year.where("m_1 = 0").pluck(:customer_id)
    sp_unsub_sp_2 = @check_year.where("pt_special_2 = 0").pluck(:customer_id)
    #4月対象外
    unsub_m_2 = @check_year.where("m_2 = 0").pluck(:customer_id)
    sp_unsub_sp_3 = @check_year.where("pt_special_3 = 0").pluck(:customer_id)
    b_unsub_c_1 = @check_year.where("c_1 = 0").pluck(:customer_id)
    #5月対象外
    unsub_m_3 = @check_year.where("m_3 = 0").pluck(:customer_id)
    sp_unsub_sp_4 = @check_year.where("pt_special_4 = 0").pluck(:customer_id)
    #6月対象外
    unsub_m_4 = @check_year.where("m_4 = 0").pluck(:customer_id)
    sp_unsub_sp_5 = @check_year.where("pt_special_5 = 0").pluck(:customer_id)
    #7月対象外
    unsub_m_5 = @check_year.where("m_5 = 0").pluck(:customer_id)
    sp_unsub_sp_6 = @check_year.where("pt_special_6 = 0").pluck(:customer_id)
    b_unsub_c_2 = @check_year.where("c_2 = 0").pluck(:customer_id)
    #8月対象外
    unsub_m_6 = @check_year.where("m_6 = 0").pluck(:customer_id)
    sp_unsub_sp_7 = @check_year.where("pt_special_7 = 0").pluck(:customer_id)
    #9月対象外
    unsub_m_7 = @check_year.where("m_7 = 0").pluck(:customer_id)
    sp_unsub_sp_8 = @check_year.where("pt_special_8 = 0").pluck(:customer_id)
    #10月対象外
    unsub_m_8 = @check_year.where("m_8 = 0").pluck(:customer_id)
    sp_unsub_sp_9 = @check_year.where("pt_special_9 = 0").pluck(:customer_id)
    b_unsub_c_3 = @check_year.where("c_3 = 0").pluck(:customer_id)
    #11月対象外
    unsub_m_9 = @check_year.where("m_9 = 0").pluck(:customer_id)
    sp_unsub_sp_10 = @check_year.where("pt_special_10 = 0").pluck(:customer_id)
    #12月対象外
    unsub_m_10 = @check_year.where("m_10 = 0").pluck(:customer_id)
    sp_unsub_sp_11 = @check_year.where("pt_special_11 = 0").pluck(:customer_id)
    
    #1月対象者
    if @now_year != @margin.year
      @margin_c_low_m_11 = @last_check_year.where("m_11 < 30000").where.not(customer_id: [unsub_m_11]).count
    
      @margin_s_low_sp_12 = @last_check_year.where("pt_special_12 < 30000").where.not(customer_id: [sp_unsub_sp_12]).count

      @margin_b_low_c_4 = @last_check_year.where("c_4 < 30000").where.not(customer_id: [b_unsub_c_4]).count

      @margin_c_high_m_11 = @last_check_year.where("m_11 >= 30000").count

      @margin_s_high_sp_12 = @last_check_year.where("pt_special_12 >= 30000").count

      @margin_b_high_c_4 = @last_check_year.where("c_4 >= 30000").count
    else
      @margin_c_low_m_11 = 0
      @margin_s_low_sp_12 = 0
      @margin_b_low_c_4 = 0
      @margin_c_high_m_11 = 0
      @margin_s_high_sp_12 = 0
      @margin_b_high_c_4 = 0
    end
    
    #2月対象者
    if @now_year != @margin.year
      @margin_c_low_m_12 = @last_check_year.where("m_12 < 30000").where.not(customer_id: [unsub_m_12]).count

      @margin_c_high_m_12 = @last_check_year.where("m_12 >= 30000").count
    else
      @margin_c_low_m_12 = 0
      @margin_c_high_m_12 = 0
    end
      
    @margin_s_low_sp_1 = @check_year.where("pt_special_1 < 30000").where.not(customer_id: [sp_unsub_sp_1]).count

    @margin_s_high_sp_1 = @check_year.where("pt_special_1 >= 30000").count
  
    #3月対象者
    @margin_c_low_m_1 = @check_year.where("m_1 < 30000").where.not(customer_id: [unsub_m_1]).count
      
    @margin_s_low_sp_2 = @check_year.where("pt_special_2 < 30000").where.not(customer_id: [sp_unsub_sp_2]).count
      
    @margin_c_high_m_1 = @check_year.where("m_1 > 30000").count
      
    @margin_s_high_sp_2 = @check_year.where("pt_special_2 >= 30000").count
    
    #4月対象者
    @margin_c_low_m_2 = @check_year.where("m_2 < 30000").where.not(customer_id: [unsub_m_2]).count
      
    @margin_s_low_sp_3 = @check_year.where("pt_special_3 < 30000").where.not(customer_id: [sp_unsub_sp_3]).count
      
    @margin_b_low_c_1 = @check_year.where("c_1 < 30000").where.not(customer_id: [b_unsub_c_1]).count
    
    @margin_c_high_m_2 = @check_year.where("m_2 > 30000").count
      
    @margin_s_high_sp_3 = @check_year.where("pt_special_3 >= 30000").count
      
    @margin_b_high_c_1 = @check_year.where("c_1 >= 30000").count
    
    #5月対象者
    @margin_c_low_m_3 = @check_year.where("m_3 < 30000").where.not(customer_id: [unsub_m_3]).count
      
    @margin_s_low_sp_4 = @check_year.where("pt_special_4 < 30000").where.not(customer_id: [sp_unsub_sp_4]).count
      
    @margin_c_high_m_3 = @check_year.where("m_3 >= 30000").count
      
    @margin_s_high_sp_4 = @check_year.where("pt_special_4 >= 30000").count
    
    #6月対象者
    @margin_c_low_m_4 = @check_year.where("m_4 < 30000").where.not(customer_id: [unsub_m_4]).count
      
    @margin_s_low_sp_5 = @check_year.where("pt_special_5 < 30000").where.not(customer_id: [sp_unsub_sp_5]).count
      
    @margin_c_high_m_4 = @check_year.where("m_4 >= 30000").count
      
    @margin_s_high_sp_5 = @check_year.where("pt_special_5 >= 30000").count
    
    #7月対象者
    @margin_c_low_m_5 = @check_year.where("m_5 < 30000").where.not(customer_id: [unsub_m_5]).count
      
    @margin_s_low_sp_6 = @check_year.where("pt_special_6 < 30000").where.not(customer_id: [sp_unsub_sp_6]).count
      
    @margin_b_low_c_2 = @check_year.where("c_2 < 30000").where.not(customer_id: [b_unsub_c_2]).count
      
    @margin_c_high_m_5 = @check_year.where("m_5 >= 30000").count
      
    @margin_s_high_sp_6 = @check_year.where("pt_special_6 >= 30000").count
      
    @margin_b_high_c_2 = @check_year.where("c_2 >= 30000").count
    
    #8月対象者
    @margin_c_low_m_6 = @check_year.where("m_6 < 30000").where.not(customer_id: [unsub_m_6]).count
        
    @margin_s_low_sp_7 = @check_year.where("pt_special_7 < 30000").where.not(customer_id: [sp_unsub_sp_7]).count
      
    @margin_c_high_m_6 = @check_year.where("m_6 >= 30000").count
      
    @margin_s_high_sp_7 = @check_year.where("pt_special_7 >= 30000").count
    
    #9月対象者
    @margin_c_low_m_7 = @check_year.where("m_7 < 30000").where.not(customer_id: [unsub_m_7]).count
      
    @margin_s_low_sp_8 = @check_year.where("pt_special_8 < 30000").where.not(customer_id: [sp_unsub_sp_8]).count
      
    @margin_c_high_m_7 = @check_year.where("m_7 >= 30000").count
      
    @margin_s_high_sp_8 = @check_year.where("pt_special_8 >= 30000").count
    
    #10月対象者
    @margin_c_low_m_8 = @check_year.where("m_8 < 30000").where.not(customer_id: [unsub_m_8]).count
      
    @margin_s_low_sp_9 = @check_year.where("pt_special_9 < 30000").where.not(customer_id: [sp_unsub_sp_9]).count
      
    @margin_b_low_c_3 = @check_year.where("c_3 < 30000").where.not(customer_id: [b_unsub_c_3]).count
      
    @margin_c_high_m_8 = @check_year.where("m_8 >= 30000").count
      
    @margin_s_high_sp_9 = @check_year.where("pt_special_9 >= 30000").count
      
    @margin_b_high_c_3 = @check_year.where("c_3 >= 30000").count
    
    #11月対象者
    @margin_c_low_m_9 = @check_year.where("m_9 < 30000").where.not(customer_id: [unsub_m_9]).count
      
    @margin_s_low_sp_10 = @check_year.where("pt_special_10 < 30000").where.not(customer_id: [sp_unsub_sp_10]).count
      
    @margin_c_high_m_9 = @check_year.where("m_9 >= 30000").count
      
    @margin_s_high_sp_10 = @check_year.where("pt_special_10 >= 30000").count
    
    #12月対象者
    @margin_c_low_m_10 = @check_year.where("m_10 < 30000").where.not(customer_id: [unsub_m_10]).count
      
    @margin_s_low_sp_11 = @check_year.where("pt_special_11 < 30000").where.not(customer_id: [sp_unsub_sp_11]).count
      
    @margin_c_high_m_10 = @check_year.where("m_10 >= 30000").count
      
    @margin_s_high_sp_11 = @check_year.where("pt_special_11 >= 30000").count
    
    #集計
    #３万円以下口数
    @year_margin_subtotal = @margin_c_low_m_11 + @margin_s_low_sp_12 + @margin_b_low_c_4 + @margin_c_low_m_12 + @margin_s_low_sp_1 + @margin_c_low_m_1 + @margin_s_low_sp_2 + @margin_c_low_m_2 + @margin_s_low_sp_3 + @margin_b_low_c_1 + @margin_c_low_m_3 + @margin_s_low_sp_4 + @margin_c_low_m_4 + @margin_s_low_sp_5 + @margin_c_low_m_5 + @margin_s_low_sp_6 + @margin_b_low_c_2 + @margin_c_low_m_6 + @margin_s_low_sp_7 + @margin_c_low_m_7 + @margin_s_low_sp_8 + @margin_c_low_m_8 + @margin_s_low_sp_9 + @margin_b_low_c_3 + @margin_c_low_m_9 + @margin_s_low_sp_10 + @margin_c_low_m_10 + @margin_s_low_sp_11
    
    #3万円以上口数
    @year_margin_total = @margin_c_high_m_11 + @margin_s_high_sp_12 + @margin_b_high_c_4 + @margin_c_high_m_12 + @margin_s_high_sp_1 + @margin_c_high_m_1 + @margin_s_high_sp_2 + @margin_c_high_m_2 + @margin_s_high_sp_3 + @margin_b_high_c_1 + @margin_c_high_m_3 + @margin_s_high_sp_4 + @margin_c_high_m_4 + @margin_s_high_sp_5 + @margin_c_high_m_5 + @margin_s_high_sp_6 + @margin_b_high_c_2 + @margin_c_high_m_6 + @margin_s_high_sp_7 + @margin_c_high_m_7 + @margin_s_high_sp_8 + @margin_c_high_m_8 + @margin_s_high_sp_9 + @margin_b_high_c_3 + @margin_c_high_m_9 + @margin_s_high_sp_10 + @margin_c_high_m_10 + @margin_s_high_sp_11
    
    #3万円以下金額
    @year_low_margin = @year_margin_subtotal * @fee_low
    @year_high_margin = @year_margin_total * @fee_high
    @year_total = @year_low_margin + @year_high_margin
    @year_profits = (@year_margin_subtotal * (700 - @fee_low)) + (@year_margin_total * (1000 - @fee_high))
  end
end
