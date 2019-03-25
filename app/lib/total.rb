class Total
  def self.my_score # 自分のpointの集計
    time = Time.zone.now
    @month = time.month
    
    if @month == 1
      @unsub = Register.where(rg_1: "退会").pluck(:customer_id)
      @sub = Register.where(rg_1: "在籍").pluck(:customer_id)
    elsif @month == 2
      @unsub = Register.where(rg_2: "退会").pluck(:customer_id)
      @sub = Register.where(rg_2: "在籍").pluck(:customer_id)
    elsif @month == 3
      @unsub = Register.where(rg_3: "退会").pluck(:customer_id)
      @sub = Register.where(rg_3: "在籍").pluck(:customer_id)
    elsif @month == 4
      @unsub = Register.where(rg_4: "退会").pluck(:customer_id)
      @sub = Register.where(rg_4: "在籍").pluck(:customer_id)
    elsif @month == 5
      @unsub = Register.where(rg_5: "退会").pluck(:customer_id)
      @sub = Register.where(rg_5: "在籍").pluck(:customer_id)
    elsif @month == 6
      @unsub = Register.where(rg_6: "退会").pluck(:customer_id)
      @sub = Register.where(rg_6: "在籍").pluck(:customer_id)
    elsif @month == 7
      @unsub = Register.where(rg_7: "退会").pluck(:customer_id)
      @sub = Register.where(rg_7: "在籍").pluck(:customer_id)
    elsif @month == 8
      @unsub = Register.where(rg_8: "退会").pluck(:customer_id)
      @sub = Register.where(rg_8: "在籍").pluck(:customer_id)
    elsif @month == 9
      @unsub = Register.where(rg_9: "退会").pluck(:customer_id)
      @sub = Register.where(rg_9: "在籍").pluck(:customer_id)
    elsif @month == 10
      @unsub = Register.where(rg_10: "退会").pluck(:customer_id)
      @sub = Register.where(rg_10: "在籍").pluck(:customer_id)
    elsif @month == 11
      @unsub = Register.where(rg_11: "退会").pluck(:customer_id)
      @sub = Register.where(rg_11: "在籍").pluck(:customer_id)
    else
      @unsub = Register.where(rg_12: "退会").pluck(:customer_id)
      @sub = Register.where(rg_12: "在籍").pluck(:customer_id)
    end
    
    score1 = Score.select("customer_id").where.not(customer_id: [@unsub]).pluck(:customer_id)
    
    #退会者のptは0にする。
    @unsub.each do |clear|
      reset = Score.find_by(customer_id: clear)
      reset["sc_#{@month}"] = 0
      if @month <= 3
        reset.scc_1 = reset.sc_1 + reset.sc_2 + reset.sc_3       #１クオーターのｐｔ集計
      elsif (3 < @month && @month <= 6)
        reset.scc_2 = reset.sc_4 + reset.sc_5 + reset.sc_6       #２クオーターのｐｔ集計
      elsif (6 < @month && @month <= 9)
        reset.scc_3 = reset.sc_7 + reset.sc_8 + reset.sc_9       #3クオーターのｐｔ集計
      else
        reset.scc_4 = reset.sc_10 + reset.sc_11 + reset.sc_12    #4クオーターのｐｔ集計
      end
      reset.save
    end
    
    # 列の数チェックと値の保存
    score1.each do |z|
      cus_set = Customer.find_by(id: z)
      @nick = cus_set.nickname
      
      @enroll1 = Sponsor.where(sponsor1: @nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
      len1 = @enroll1.length
      row = @enroll1
      
      @enroll2 = Sponsor.where(sponsor2: @nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
      len2 = @enroll2.length
      
      @enroll3 = Sponsor.where(sponsor3: @nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
      len3 = @enroll3.length
      
      @enroll4 = Sponsor.where(sponsor4: @nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
      len4 = @enroll4.length
      
      @enroll5 = Sponsor.where(sponsor5: @nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
      len5 = @enroll5.length
      
      @enroll6 = Sponsor.where(sponsor6: @nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
      len6 = @enroll6.length
      
      @enroll7 = Sponsor.where(sponsor7: @nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
      len7 = @enroll7.length
    
      #１段目の退会者を取り出す。
      spo_diff = Sponsor.where(sponsor1: @nick).where.not(customer_id: [@sub]).pluck(:customer_id)
      #１段目の在籍人数チェック
      
      if spo_diff.empty?         #１段目の紹介者が全て在籍なら
        len1 = len1  #その在籍人数を有効列とする。
      else
        spo_diff.each do |u|
          b = Customer.find_by(id: u)
          c = b.nickname
          
          e = Sponsor.where(sponsor1: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
          f = Sponsor.where(sponsor2: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
          g = Sponsor.where(sponsor3: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
          h = Sponsor.where(sponsor4: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
          i = Sponsor.where(sponsor5: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
          j = Sponsor.where(sponsor6: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
          if e.present?        # 退会者列の1段目に在籍であればその列は有効列としてカウントする。
            row << u
          elsif f.present?     # 退会者列の2段目が在籍であればその列は有効列としてカウントする。
            row << u
          elsif g.present?     # 退会者列の3段目が在籍であればその列は有効列としてカウントする。
            row << u
          elsif h.present?     # 退会者列の4段目が在籍であればその列は有効列としてカウントする。 
            row << u
          elsif i.present?     # 退会者列の5段目が在籍であればその列は有効列としてカウントする。 
            row << u
          else
            if j.present?     # 退会者列の6段目が在籍であればその列は有効列としてカウントする。
              row << u
            end
          end
        end
      end
      
      score = Score.find_by(customer_id: z)
      if row.empty?          #有効列が0
        score["sc_#{@month}"] = 0
      elsif row.length == 1  #有効列が1
        score["sc_#{@month}"] = len1 * 50
      elsif row.length == 2  #有効列が2
        score["sc_#{@month}"] = len1 * 50 + len2 * 40
      elsif row.length == 3  #有効列が3
        score["sc_#{@month}"] = len1 * 50 + len2 * 40 + len3 * 30        
      elsif row.length == 4  #有効列が4
        score["sc_#{@month}"] = len1 * 50 + len2 * 40 + len3 * 30 + len4 * 20
      elsif row.length == 5  #有効列が5
        score["sc_#{@month}"] = len1 * 50 + len2 * 40 + len3 * 30 + len4 * 20 + len5 * 10
      elsif row.length == 6  #有効列が6
        score["sc_#{@month}"] = len1 * 50 + len2 * 40 + len3 * 30 + len4 * 20 + len5 * 10 + len6 * 5
      else                   #有効列が7
        score["sc_#{@month}"] = len1 * 50 + len2 * 40 + len3 * 30 + len4 * 20 + len5 * 10 + len6 * 5 + len7 * 3
      end
      
      if @month <= 3
        score.scc_1 = score.sc_1 + score.sc_2 + score.sc_3       #１クオーターのｐｔ集計
      elsif (3 < @month && @month <= 6)
        score.scc_2 = score.sc_4 + score.sc_5 + score.sc_6      #２クオーターのｐｔ集計
      elsif (6 < @month && @month <= 9)
        score.scc_3 = score.sc_7 + score.sc_8 + score.sc_9       #3クオーターのｐｔ集計
      else
        score.scc_4 = score.sc_10 + score.sc_11 + score.sc_12    #4クオーターのｐｔ集計
      end
      score.save
    end
  end

  def self.score_reset       #テーブルのリセット
    sc_reset = Score.select("customer_id").pluck(:customer_id)
    sc_reset.each do |x|
      sc_reset2 = Score.find_by(customer_id: x)
      sc_reset2.sc_1 = 0
      sc_reset2.sc_2 = 0
      sc_reset2.sc_3 = 0
      sc_reset2.scc_1 = 0
      sc_reset2.sc_4 = 0
      sc_reset2.sc_5 = 0
      sc_reset2.sc_6 = 0
      sc_reset2.scc_2 = 0
      sc_reset2.sc_7 = 0
      sc_reset2.sc_8 = 0
      sc_reset2.sc_9 = 0
      sc_reset2.scc_3 = 0
      sc_reset2.sc_10 = 0
      sc_reset2.sc_11 = 0
      sc_reset2.sc_12 = 0
      sc_reset2.scc_4 = 0
      sc_reset2.save
    end
  end
end
    
  