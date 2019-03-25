class Admin::SubTwentiesController < Admin::Base
  def edit
    @choice = Choice.find(1)
    @choice.detection = 0
    @choice.save

    if @choice.remuneration == "キャッシュバック"
      @choice = Choice.find(1)
      @choice_title = @choice.remuneration
      @check = Pay.find(1)
      @year = @check.year
      @month = @check.month

      @customer = Customer.find(params[:id])
      @acc_name = @customer.family_name + ' ' + @customer.given_name
      @nickname = @customer.nickname
      @twentie_form = Admin::TwentieForm.new(Twentie.find(params[:id]))
    
    elsif @choice.remuneration == "ボーナス"
      @choice = Choice.find(1)
      @choice_title = @choice.remuneration
      @check = Pay.find(1)
      @year = @check.year
      @month = @check.month
      @quarter = @check.quarter

      if @month == 1
        @month2 = 11
      elsif @month == 2
        @month2 = 12
      else
        @month2 = @month - 2
      end
      
      if @month == 1
        @quarter1 = 4
      elsif @month == 4
        @quarter1 = 1
      elsif @month == 7
        @quarter1 = 2
      else
        if @month == 10
          @quarter1 = 3
        end
      end
      
      if @quarter == 0
        if @month <= 3
          @quarter = 1
        elsif @month <= 6
          @quarter = 2
        elsif @month <= 9
          @quarter = 3
        else
          @quarter = 4
        end
      end

      @customer = Customer.find(params[:id])
      @acc_name = @customer.family_name + ' ' + @customer.given_name
      @nickname = @customer.nickname
      @twentie_form = Admin::TwentieForm.new(Twentie.find(params[:id]))
    
    else
      if @choice.remuneration == "特別会員ボーナス" #特別会員ボーナス
        @choice = Choice.find(1)
        @choice_title = @choice.remuneration
        @check = Pay.find(1)
        @year = @check.year
        @month = @check.month

        @customer = Customer.find(params[:id])
        @acc_name = @customer.family_name + ' ' + @customer.given_name
        @nickname = @customer.nickname
        @twentie_form = Admin::TwentieForm.new(Twentie.find(params[:id]))
      end
    end
  end

  def update
    @choice = Choice.find(1)
    @choice.detection = 0
    @choice.save

    if @choice.remuneration == "キャッシュバック"
      time = Time.zone.now
      @check = Pay.find(1)
      @year = @check.year
      @month = @check.month
      
      @twentie_form = Admin::TwentieForm.new(Twentie.find(params[:id]))
      @twentie_form.assign_attributes(params[:form])

      user = Customer.find(params[:id])

      if @twentie_form.present?
        @twentie_form.save
        
        @twentie = Twentie.find(params[:id])

        if @month == 1
          if @twentie.transfer_m_1 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_1 = "未送金"
            @twentie.transfer_m_1 = "未送金"
            cache_up
          end
             
        elsif @month == 2
          if @twentie.transfer_m_2 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_2 = "未送金"
            @twentie.transfer_m_2 = "未送金"
            cache_up
          end
            
        elsif @month == 3
          if @twentie.transfer_m_3 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_3 = "未送金"
            @twentie.transfer_m_3 = "未送金"
            cache_up
          end
            
        elsif @month == 4
          if @twentie.transfer_m_4 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_4 = "未送金"
            @twentie.transfer_m_4 = "未送金"
            cache_up
          end
            
        elsif @month == 5
          if @twentie.transfer_m_5 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_5 = "未送金"
            @twentie.transfer_m_5 = "未送金"
            cache_up
          end
        
        elsif @month == 6
          if @twentie.transfer_m_6 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_6 = "未送金"
            @twentie.transfer_m_6 = "未送金"
            cache_up
          end
        
        elsif @month == 7
          if @twentie.transfer_m_7 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_7 = "未送金"
            @twentie.transfer_m_7 = "未送金"
            cache_up
          end
         
        elsif @month == 8
          if @twentie.transfer_m_8 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_8 = "未送金"
            @twentie.transfer_m_8 = "未送金"
            cache_up
          end
          
        elsif @month == 9
          if @twentie.transfer_m_9 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_9 = "未送金"
            @twentie.transfer_m_9 = "未送金"
            cache_up
          end
          
        elsif @month == 10
          if @twentie.transfer_m_10 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_10 = "未送金"
            @twentie.transfer_m_10 = "未送金"
            cache_up
          end
         
        elsif @month == 11
          if @twentie.transfer_m_11 == "送金済"
            cache_sub 
          else 
            @twentie.cache_payment_11 = "未送金"
            @twentie.transfer_m_11 = "未送金"
            cache_up
          end
            
        else
          if @twentie.transfer_m_12 == "送金済"
            cache_sub
          else 
            @twentie.cache_payment_12 = "未送金"
            @twentie.transfer_m_12 = "未送金"
            cache_up
          end
        end
      else
        flash.now.alert = '入力に誤りがあります。'
        render action: 'edit'
      end

    elsif @choice.remuneration == "ボーナス"
      time = Time.zone.now
      @check = Pay.find(1)
      @year = @check.year
      @month = @check.month
      @quarter = @check.quarter
      
      if @quarter == 0
        if @month <= 3
          @quarter = 1
        elsif @month <= 6
          @quarter = 2
        elsif @month <= 9
          @quarter = 3
        else
          @quarter = 4
        end
      end

      @twentie_form = Admin::TwentieForm.new(Twentie.find(params[:id]))
      @twentie_form.assign_attributes(params[:form])

      user = Customer.find(params[:id])

      if @twentie_form.present?
        @twentie_form.save
        
        @twentie = Twentie.find(params[:id])
        
        if @quarter == 1
          if @twentie.transfer_c_1 == "送金済"
            bonus_sub
          else 
            @twentie.bonus_payment_1 = "未送金"
            @twentie.transfer_c_1 = "未送金"
            bonus_up
          end
        
        elsif @quarter == 2
          if @twentie.transfer_c_2 == "送金済"
            bonus_sub
          else 
            @twentie.bonus_payment_2 = "未送金"
            @twentie.transfer_c_2 = "未送金"
            bonus_up
          end

        elsif @quarter == 3
          if @twentie.transfer_c_3 == "送金済"
            bonus_sub
          else 
            @twentie.bonus_payment_3 = "未送金"
            @twentie.transfer_c_3 = "未送金"
            bonus_up
          end
      
        else
          if @twentie.transfer_c_4 == "送金済"
            bonus_sub
          else 
            @twentie.bonus_payment_4 = "未送金"
            @twentie.transfer_c_4 = "未送金"
            bonus_up
          end
        end
      else
        flash.now.alert = '入力に誤りがあります。'
        render action: 'edit'
      end

    else
      if @choice.remuneration == "特別会員ボーナス" #特別会員ボーナス
        time = Time.zone.now
        @check = Pay.find(1)
        @year = @check.year
        @month = @check.month

        @twentie_form = Admin::TwentieForm.new(Twentie.find(params[:id]))
        @twentie_form.assign_attributes(params[:form])

        user = Customer.find(params[:id])

        if @twentie_form.present?
          @twentie_form.save
          
          @twentie = Twentie.find(params[:id])
          
          if @month == 1
            if @twentie.sp_transfer_1 == "送金済"
              special_sub
            else 
              @twentie.special_payment_1 = "未送金"
              @twentie.sp_transfer_1 = "未送金"
              special_up
            end
            
          elsif @month == 2
            if @twentie.sp_transfer_2 == "送金済"
              special_sub
            else 
              @twentie.special_payment_2 = "未送金"
              @twentie.sp_transfer_2 = "未送金"
              special_up
            end
           
          elsif @month == 3
            if @twentie.sp_transfer_3 == "送金済"
              special_sub
            else 
              @twentie.special_payment_3 = "未送金"
              @twentie.sp_transfer_3 = "未送金"
              special_up
            end
            
          elsif @month == 4
            if @twentie.sp_transfer_4 == "送金済"
              special_sub
            else 
              @twentie.special_payment_4 = "未送金"
              @twentie.sp_transfer_4 = "未送金"
              special_up
            end
          
          elsif @month == 5
            if @twentie.sp_transfer_5 == "送金済"
              special_sub
            else 
              @twentie.special_payment_5 = "未送金"
              @twentie.sp_transfer_5 = "未送金"
              special_up
            end
           
          elsif @month == 6
            if @twentie.sp_transfer_6 == "送金済"
              special_sub
            else 
              @twentie.special_payment_6 = "未送金"
              @twentie.sp_transfer_6 = "未送金"
              special_up
            end
           
          elsif @month == 7
            if @twentie.sp_transfer_7 == "送金済"
              special_sub
            else 
              @twentie.special_payment_7 = "未送金"
              @twentie.sp_transfer_7 = "未送金"
              special_up
            end
           
          elsif @month == 8
            if @twentie.sp_transfer_8 == "送金済"
              special_sub
            else 
              @twentie.special_payment_8 = "未送金"
              @twentie.sp_transfer_8 = "未送金"
              special_up
            end
           
          elsif @month == 9
            if @twentie.sp_transfer_9 == "送金済"
              special_sub
            else 
              @twentie.special_payment_9 = "未送金"
              @twentie.sp_transfer_9 = "未送金"
              special_up
            end
            
          elsif @month == 10
            if @twentie.sp_transfer_10 == "送金済"
              special_sub
            else 
              @twentie.special_payment_10 = "未送金"
              @twentie.sp_transfer_10 = "未送金"
              special_up
            end
            
          elsif @month == 11
            if @twentie.sp_transfer_11 == "送金済"
              special_sub
            else 
              @twentie.special_payment_11 = "未送金"
              @twentie.sp_transfer_11 = "未送金"
              special_up
            end
            
          else
            if @twentie.sp_transfer_12 == "送金済"
              special_sub
            else 
              @twentie.special_payment_12 = "未送金"
              @twentie.sp_transfer_12 = "未送金"
              special_up
            end 
          end
        else
          flash.now.alert = '入力に誤りがあります。'
          render action: 'edit'
        end
      end
    end
  end
  
  def cache_sub
    flash.notice = 'キャッシュバック送金履歴は更新しておりません。'
    redirect_to :cache_acquisition_admin_record
  end
  
  def bonus_sub
    flash.notice = 'ボーナス送金履歴は更新しておりません。'
    redirect_to :bonus_acquisition_admin_record
  end
  
  def special_sub
    flash.notice = '特別会員ボーナス送金履歴は更新しておりません。'
    redirect_to :sp_member_admin_record
  end
  
  def cache_up
    @twentie.save
    flash.notice = 'キャッシュバック送金履歴を更新しました。'
    redirect_to :cache_acquisition_admin_record
  end
  
  def bonus_up
    @twentie.save
    flash.notice = 'ボーナス送金履歴を更新しました。'
    redirect_to :bonus_acquisition_admin_record
  end
  
  def special_up
    @twentie.save
    flash.notice = '特別会員ボーナス送金履歴を更新しました。'
    redirect_to :sp_member_admin_record
  end
end
