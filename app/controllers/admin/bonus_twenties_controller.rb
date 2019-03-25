class Admin::BonusTwentiesController < Admin::Base
  def edit
    @choice = Choice.find(1)
    @choice.detection = 1
    @choice.remuneration = "ボーナス"
    @choice.save
    
    @check = Retrieval.find(1)
    @year = @check.year
    @month = @check.month
    if @month == 1
      @year = @year - 1
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
    
    @customer = Customer.find(params[:id])
    @acc_name = @customer.family_name + ' ' + @customer.given_name
    @nickname = @customer.nickname
    
    if @quarter1 == 4
      @nineteen_form = Admin::NineteenForm.new(Nineteen.find(params[:id]))
    else
      @twentie_form = Admin::TwentieForm.new(Twentie.find(params[:id]))
    end
  end
  
  def update
    @choice = Choice.find(1)
    @choice.detection = 1
    @choice.remuneration = "ボーナス"
    @choice.save
    
    time = Time.zone.now
    @check = Retrieval.find(1)
    @year = @check.year
    @month = @check.month

    if @month == 1
      @quarter = 4
    elsif @month == 4
      @quarter = 1
    elsif @month == 7
      @quarter = 2
    else
      if @month == 10
        @quarter = 3
      end
    end

    @twentie_form = Admin::TwentieForm.new(Twentie.find(params[:id]))
    @twentie_form.assign_attributes(params[:form])

    user = Customer.find(params[:id])

    if @twentie_form.present?
      @twentie_form.save

      @twentie = Twentie.find(params[:id])

      if @quarter == 1
        if @twentie.bonus_payment_1 == "未送金"
          if @twentie.transfer_c_1 == "未送金"
            bonus_up
          else
            @twentie.bonus_payment_1 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            bonus_sub
          end
        end

      elsif @quarter == 2
        if @twentie.bonus_payment_2 == "未送金"
          if @twentie.transfer_c_2 == "未送金"
            bonus_up
          else
            @twentie.bonus_payment_2 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            bonus_sub
          end
        end
        
      elsif @quarter == 3
        if @twentie.bonus_payment_3 == "未送金"
          if @twentie.transfer_c_3 == "未送金"
            bonus_up
          else
            @twentie.bonus_payment_3 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            bonus_sub
          end
        end
        
      else
        if @twentie.bonus_payment_4 == "未送金"
          if @twentie.transfer_c_4 == "未送金"
            bonus_up
          else
            @twentie.bonus_payment_4 = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
            bonus_sub
          end
        end
      end
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
  
  def bonus_sub
    @twentie.save
    user = Customer.find(params[:id])
    user.bonus_lock = "1"
    user.save
    flash.notice = 'ボーナス送金履歴を更新しました。'
    redirect_to :payment_list_admin_record
    MoneyTransferMailer.bonus_transfer(user).deliver_now
  end
  
  def bonus_up
    flash.notice = 'ボーナス送金履歴は更新しておりません。'
    redirect_to :payment_list_admin_record
  end
end