class Admin::SpecialTwentyFivesController < Admin::Base
  def edit
    @choice = Choice.find(1)
    @choice.detection = 1
    @choice.remuneration = "特別会員ボーナス"
    @choice.save
    
    @check = Retrieval.find(1)
    @year = @check.year
    @month = @check.month
    
    if @month == 1
      @cache_year = @year - 1
      @month1 = 12
    else
      @cache_year = @year
      @month1 = @month - 1
    end
   
    @customer = Customer.find(params[:id])
    @acc_name = @customer.family_name + ' ' + @customer.given_name
    @nickname = @customer.nickname
    
    if @month == 1
      @twenty_four_form = Admin::TwentyFourForm.new(TwentyFour.find(params[:id]))
    else
      @twenty_five_form = Admin::TwentyFiveForm.new(TwentyFive.find(params[:id]))
    end
  end
  
  def update
    @choice = Choice.find(1)
    @choice.detection = 1
    @choice.remuneration = "特別会員ボーナス"
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
        if @twenty_five.special_payment_12 == "未送金"
          if @twenty_five.sp_transfer_12 == "未送金"
            special_up
          else 
            @twenty_five.special_payment_12 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end

      elsif @month == 2
        if @twenty_five.special_payment_1 == "未送金" 
          if @twenty_five.sp_transfer_1 == "未送金"
            special_up
          else 
            @twenty_five.special_payment_1 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end

      elsif @month == 3
        if @twenty_five.special_payment_2 == "未送金" 
          if @twenty_five.sp_transfer_2 == "未送金"
            special_up
          else 
            @twenty_five.special_payment_2 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end

      elsif @month == 4
        if @twenty_five.special_payment_3 == "未送金" 
          if @twenty_five.sp_transfer_3 == "未送金"
            special_up
          else
            @twenty_five.special_payment_3 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end

      elsif @month == 5
        if @twenty_five.special_payment_4 == "未送金"
          if @twenty_five.sp_transfer_4 == "未送金"
            special_up
          else
            @twenty_five.special_payment_4 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end

      elsif @month == 6
        if @twenty_five.special_payment_5 == "未送金"
          if @twenty_five.sp_transfer_5 == "未送金"
            special_up
          else
            @twenty_five.special_payment_5 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end 

      elsif @month == 7
        if @twenty_five.special_payment_6 == "未送金"
          if @twenty_five.sp_transfer_6 == "未送金"
            special_up
          else
            @twenty_five.special_payment_6 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end 

      elsif @month == 8
        if @twenty_five.special_payment_7 == "未送金"
          if @twenty_five.sp_transfer_7 == "未送金"
            special_up
          else
            @twenty_five.special_payment_7 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end 

      elsif @month == 9
        if @twenty_five.special_payment_8 == "未送金"
          if @twenty_five.sp_transfer_8 == "未送金"
            special_up
          else
            @twenty_five.special_payment_8 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end 

      elsif @month == 10
        if @twenty_five.special_payment_9 == "未送金"
          if @twenty_five.sp_transfer_9 == "未送金"
            special_up
          else
            @twenty_five.special_payment_9 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end 

      elsif @month == 11
        if @twenty_five.special_payment_10 == "未送金"
          if @twenty_five.sp_transfer_10 == "未送金"
            special_up
          else
            @twenty_five.special_payment_10 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end 

      else
        if @twenty_five.special_payment_11 == "未送金"
          if @twenty_five.sp_transfer_11 == "未送金"
            special_up
          else
            @twenty_five.special_payment_11 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            special_sub
          end
        end  
      end
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end

  def special_sub
    @twenty_five.save
    user = Customer.find(params[:id])
    user.special_lock = "1"
    user.save
    flash.notice = '特別会員ボーナス送金履歴を更新しました。'
    redirect_to :payment_list_admin_record
    MoneyTransferMailer.sp_transfer(user).deliver_now
  end

  def special_up
    flash.notice = '特別会員ボーナス送金履歴は更新しておりません。'
    redirect_to :payment_list_admin_record
  end
end
  