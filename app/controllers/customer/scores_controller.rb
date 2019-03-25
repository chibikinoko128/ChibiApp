class Customer::ScoresController < Customer::Base
  def show
    time = Time.zone.now
    @year = time.year
    @month = time.month
    @customer = Customer.find_by(id: current_customer.id)
    
    unsub_register
    
    score = Score.find_by(customer_id: current_customer.id)
    data = score.attributes
    
    @mpt = data["sc_#{@month}"]
    
    member = Member.find_by(customer_id: current_customer.id)
    data = member.attributes
    @member = data["mb_#{@month}"]
    
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
    
    sp1 = Sponsor.where(sponsor1: @customer.nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    sp2 = Sponsor.where(sponsor2: @customer.nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    sp3 = Sponsor.where(sponsor3: @customer.nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    sp4 = Sponsor.where(sponsor4: @customer.nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    sp5 = Sponsor.where(sponsor5: @customer.nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    sp6 = Sponsor.where(sponsor6: @customer.nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    sp7 = Sponsor.where(sponsor7: @customer.nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    
    @member1 = sp1.length + sp2.length + sp3.length + sp4.length + sp5.length + sp6.length + sp7.length
    
    abc = @customer.created_at.year
    bbb = @customer.created_at.month
    ccc = "-"
    @xxx = abc.to_s + ccc + bbb.to_s

    year = time.year
    month = time.month
    @zzz = year.to_s + ccc + month.to_s
    if @xxx == @zzz
      @mpt = @mpt + 700
      if @mpt <= 700
        @mpt1 = 0
        @mpt2 = "キャッシュバックは発生しません。"
      elsif @mpt > 30000
        @mpt1 = @mpt - 1000
      else
        @mpt1 = @mpt - 700
      end
    end
    
    if @mpt <= 700
      @mpt1 = 0
      @mpt2 = "キャッシュバックは発生しません。"
    elsif (700 < @mpt && @mpt < 30000)
      @mpt1 = @mpt - 700
    else
      @mpt1 = @mpt - 1000
    end
      
    if @month <= 10
      @month1 = @month + 2
    elsif @month == 11
      @month1 = 1
    else
      @month1 = 2
    end
    
    if @month <= 11
      @mpt4 = @month + 1
    else
      @mpt4 = 1
    end
    
    if @xxx == @zzz
      if @mpt < 1700
        @mpt5 = @mpt1
        @mpt6 = @month1.to_s + "月分の利用料金は差し引きできていません。"
        @mpt3 = "サービスの利用を続けるには" + @month.to_s + "月末までに利用料金（￥1000）の振込みが必要です。" 
      elsif (1700 <= @mpt && @mpt < 30000)
        @mpt3 = @month1.to_s + "月分の利用料金の振込みは不要です。"
        @mpt5 = @mpt - 1700
    
        #reg = Register.find_by(customer_id: current_customer.id)
        #reg["rg_#{@month1}"] = "在籍"
        #reg.save
      else
        @mpt3 = @month1.to_s + "月分の利用料金の振込みは不要です。"
        @mpt5 = @mpt - 2000
    
        #reg = Register.find_by(customer_id: current_customer.id)
        #reg["rg_#{@month1}"] = "在籍"
        #reg.save
      end
    elsif @mpt < 1700
      @mpt5 = @mpt1
      @mpt6 = @month1.to_s + "月分の利用料金は差し引きできていません。"
      @mpt3 = "サービスの利用を続けるには" + @month.to_s + "月末までに利用料金（￥1000）の振込みが必要です。"
    elsif (1700 < @mpt && @mpt < 30000)
      @mpt3 = @month1.to_s + "月分の利用料金の振込みは不要です。"
      @mpt5 = @mpt - 1700
    
      #reg = Register.find_by(customer_id: current_customer.id)
      #reg["rg_#{@month1}"] = "在籍"
      #reg.save
    else
      @mpt3 = @month1.to_s + "月分の利用料金の振込みは不要です。"
      @mpt5 = @mpt - 2000
    
      #reg = Register.find_by(customer_id: current_customer.id)
      #reg["rg_#{@month1}"] = "在籍"
      #reg.save
    end

    @nickname = @customer.nickname
    @sp1 = Sponsor.where(sponsor1:@nickname).pluck(:customer_id)
    @enro_sp1 = Sponsor.where(sponsor1:@nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    
    if @sp1.empty?
      @sponsor = 0
      @enro = 0
      @row = 0
      @row1 = 0
    else 
      @sponsor = @sp1.length
    end
    
    if @enro_sp1.empty?
      @enro = 0
    else
      @enro = @enro_sp1.length
    end
    
    # 列の在籍者のチェック
    enro1 = @sp1 - @enro_sp1
    
    if @sp1 == @enro_sp1
      @row = @enro_sp1.length
      if @enro_sp1.length >= 7
        @row1 = 7
      else 
        @row1 = @enro_sp1.length
      end
    else
      enro1.each do |t|
        enro2 = Customer.find_by(id: t)
        @sp_nick = enro2.nickname
        @nickname = @sp_nick
        enrollment_check

        if @enroll1.present?        # １段目のチェック
          row = @enro_sp1 << t  
        elsif @enroll2.present?     # ２段目のチェック 
          row = @enro_sp1 << t
        elsif @enroll3.present?     # ３段目のチェック 
          row = @enro_sp1 << t
        elsif @enroll4.present?     # 4段目のチェック
          row = @enro_sp1 << t
        elsif @emroll5.present?     # 5段目のチェック  
          row = @enro_sp1 << t
        elsif @enroll6.present?     # ６段目のチェック 
          row = @enro_sp1 << t
        elsif @enroll7.present?     # ７段目のチェック
          row = @enro_sp1 << t
        else
          row = @enro_sp1
        end
        
        if row.blank?
          @row = 0
          @row1 = 0
        elsif row.length >= 7
          @row = row.length
          @row1 = 7
        else 
          @row = row.length
          @row1 = row.length
        end
      end
    end
    
    @nickname = @customer.nickname
    all_point
  end

# ７段目まで取得した場合のｐｔ
  def all_point
    if @xxx == @zzz
      enrollment_check
      @all_pt = @enroll1.length * 50 + @enroll2.length * 40 + @enroll3.length * 30 + @enroll4.length * 20 + @enroll5.length * 10 + @enroll6.length * 5 + @enroll7.length * 3 + 700
    else  
      enrollment_check
      @all_pt = @enroll1.length * 50 + @enroll2.length * 40 + @enroll3.length * 30 + @enroll4.length * 20 + @enroll5.length * 10 + @enroll6.length * 5 + @enroll7.length * 3
    end
  end
    
  def enrollment_check
    @enroll1 = Sponsor.where(sponsor1: @nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    @enroll2 = Sponsor.where(sponsor2: @nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    @enroll3 = Sponsor.where(sponsor3: @nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    @enroll4 = Sponsor.where(sponsor4: @nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    @enroll5 = Sponsor.where(sponsor5: @nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    @enroll6 = Sponsor.where(sponsor6: @nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
    @enroll7 = Sponsor.where(sponsor7: @nickname).where.not(customer_id: [@unsub]).pluck(:customer_id)
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
end