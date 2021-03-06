class Admin::CacheTwentyFivesController < Admin::Base
  def edit
    @choice = Choice.find(1)
    @choice.detection = 1
    @choice.remuneration = "キャッシュバック"
    @choice.save
    
    @check = Retrieval.find(1)
    @year = @check.year
    @month = @check.month
    if @month == 1
      @cache_year = @year - 1
      @month1 = 11
    elsif @month == 2
      @cache_year = @year - 1
      @month1 = 12
    else
      @cache_year = @year
      @month1 = @month - 2
    end
    
    @customer = Customer.find(params[:id])
    @acc_name = @customer.family_name + ' ' + @customer.given_name
    @nickname = @customer.nickname
    
    if @month <= 2
      @twenty_four_form = Admin::TwentyFourForm.new(TwentyFour.find(params[:id]))
    else
      @twenty_five_form = Admin::TwentyFiveForm.new(TwentyFive.find(params[:id]))
    end
  end
    
  def update
    @choice = Choice.find(1)
    @choice.detection = 1
    @choice.remuneration = "キャッシュバック"
    @choice.save
    
    time = Time.zone.now
    @check = Retrieval.find(1)
    @year = @check.year
    @month = @check.month

    @twenty_five_form = Admin::TwentyFiveForm.new(TwentyFive.find(params[:id]))
    @twenty_five_form.assign_attributes(params[:form])

    user = Customer.find(params[:id])

    if @twenty_five_form.present?
      @twenty_five_form.save

      @twenty_five = TwentyFive.find(params[:id])
      
      if @month == 1
        if @twenty_five.cache_payment_11 == "未送金"
          if @twenty_five.transfer_m_11 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_11 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 2
        if @twenty_five.cache_payment_12 == "未送金"
          if @twenty_five.transfer_m_12 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_12 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 3
        if @twenty_five.cache_payment_1 == "未送金"
          if @twenty_five.transfer_m_1 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_1 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 4
        if @twenty_five.cache_payment_2 == "未送金"
          if @twenty_five.transfer_m_2 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_2 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 5
        if @twenty_five.cache_payment_3 == "未送金"
          if @twenty_five.transfer_m_3 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_3 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 6
        if @twenty_five.cache_payment_4 == "未送金"
          if @twenty_five.transfer_m_4 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_4 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
          cache_sub
          end
        end

      elsif @month == 7
        if @twenty_five.cache_payment_5 == "未送金"
          if @twenty_five.transfer_m_5 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_5 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 8
        if @twenty_five.cache_payment_6 == "未送金"
          if @twenty_five.transfer_m_6 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_6 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 9
        if @twenty_five.cache_payment_7 == "未送金"
          if @twenty_five.transfer_m_7 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_7 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 10
        if @twenty_five.cache_payment_8 == "未送金"
          if @twenty_five.transfer_m_8 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_8 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 11
        if @twenty_five.cache_payment_9 == "未送金"
          if @twenty_five.transfer_m_9 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_9 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      else
        if @twenty_five.cache_payment_10 == "未送金"
          if @twenty_five.transfer_m_10 == "未送金"
            cache_up
          else 
            @twenty_five.cache_payment_10 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end
      end
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
    
  def cache_sub
    @twenty_five.save
    user = Customer.find(params[:id])
    user.lock = "1"
    user.save
    flash.notice = 'キャッシュバック送金履歴を更新しました。'
    redirect_to :payment_list_admin_record
    MoneyTransferMailer.transfer(user).deliver_now
  end
  
  def cache_up
    flash.notice = 'キャッシュバック送金履歴は更新しておりません。'
    redirect_to :payment_list_admin_record
  end
end
