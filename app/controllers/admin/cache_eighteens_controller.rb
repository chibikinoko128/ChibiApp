class Admin::CacheEighteensController < Admin::Base
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
    @eighteen_form = Admin::EighteenForm.new(Eighteen.find(params[:id]))
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
  
    @eighteen_form = Admin::EighteenForm.new(Eighteen.find(params[:id]))
    @eighteen_form.assign_attributes(params[:form])
   
    user = Customer.find(params[:id])
    
    if @eighteen_form.present?
      @eighteen_form.save

      @eighteen = Eighteen.find(params[:id])
      
      if @month == 1
        if @eighteen.cache_payment_11 == "未送金"
          if @eighteen.transfer_m_11 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_11 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 2
        if @eighteen.cache_payment_12 == "未送金"
          if @eighteen.transfer_m_12 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_12 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 3
        if @eighteen.cache_payment_1 == "未送金"
          if @eighteen.transfer_m_1 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_1 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 4
        if @eighteen.cache_payment_2 == "未送金"
          if @eighteen.transfer_m_2 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_2 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 5
        if @eighteen.cache_payment_3 == "未送金"
          if @eighteen.transfer_m_3 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_3 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 6
        if @eighteen.cache_payment_4 == "未送金"
          if @eighteen.transfer_m_4 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_4 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
          cache_sub
          end
        end

      elsif @month == 7
        if @eighteen.cache_payment_5 == "未送金"
          if @eighteen.transfer_m_5 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_5 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 8
        if @eighteen.cache_payment_6 == "未送金"
          if @eighteen.transfer_m_6 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_6 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 9
        if @eighteen.cache_payment_7 == "未送金"
          if @eighteen.transfer_m_7 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_7 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 10
        if @eighteen.cache_payment_8 == "未送金"
          if @eighteen.transfer_m_8 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_8 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      elsif @month == 11
        if @eighteen.cache_payment_9 == "未送金"
          if @eighteen.transfer_m_9 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_9 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            cache_sub
          end
        end

      else
        if @eighteen.cache_payment_10 == "未送金"
          if @eighteen.transfer_m_10 == "未送金"
            cache_up
          else 
            @eighteen.cache_payment_10 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
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
    @eighteen.save
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
