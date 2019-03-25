class Assemble
  def self.my_point       #列の成績
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
   
    # 列の数チェックと値の保存
    @sub.each do |z|   #全在籍者のみイテレート
      cus_set = Customer.find_by(id: z)   #全在籍者のcustomerレコードをイテレートし検出。
      @nick = cus_set.nickname       # イテレート検出した在籍者のニックネーム。
      
      @enroll1 = Sponsor.where(sponsor1: @nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
      spo_len1 = @enroll1.length
      row = @enroll1
      
      spo = Sponsor.where(sponsor1: @nick).pluck(:customer_id)  #その1段目の紹介者を退会者も含め配列で取り出す
      
      spo.each do |h|
        customer = Customer.find_by(id: h)
        sec_nick = customer.nickname
        
        register = Register.find_by(customer_id: h)
        if register["rg_#{@month}"] == "退会"
          my_pt = []
        else
          my_pt = [1]
        end
   
        # その1段目の在籍者の配列を取り出す。
        @sub_enroll1 = Sponsor.where(sponsor1: sec_nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
        len1 = @sub_enroll1.length
      
        # その2段目の在籍者の配列を取り出す。
        @sub_enroll2 = Sponsor.where(sponsor2: sec_nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
        len2 = @sub_enroll2.length
      
        # その3段目の在籍者の配列を取り出す。
        @sub_enroll3 = Sponsor.where(sponsor3: sec_nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
        len3 = @sub_enroll3.length
      
        # その4段目の在籍者の配列を取り出す。
        @sub_enroll4 = Sponsor.where(sponsor4: sec_nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
        len4 = @sub_enroll4.length
      
        # その5段目の在籍者の配列を取り出す。
        @sub_enroll5 = Sponsor.where(sponsor5: sec_nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
        len5 = @sub_enroll5.length
      
        # その6段目の在籍者の配列を取り出す。
        @sub_enroll6 = Sponsor.where(sponsor6: sec_nick).where.not(customer_id: [@unsub]).pluck(:customer_id)
        len6 = @sub_enroll6.length
        
        #１段目の退会者を取り出す。
        spo_diff = Sponsor.where(sponsor1: @nick).where.not(customer_id: [@sub]).pluck(:customer_id)
        #１段目の在籍人数チェック
        
        if spo_diff.empty?         #１段目の紹介者が全て在籍なら
            row = @enroll1  #その在籍人数を有効列とする。
        else
          spo_diff.each do |u|
            b = Customer.find_by(id: u)
            c = b.nickname
          
            e = Sponsor.where(sponsor1: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
            f = Sponsor.where(sponsor2: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
            g = Sponsor.where(sponsor3: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
            k = Sponsor.where(sponsor4: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
            i = Sponsor.where(sponsor5: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
            j = Sponsor.where(sponsor6: c).where.not(customer_id: [@unsub]).pluck(:customer_id)
          
            if e.present?        # 退会者列の1段目に在籍であればその列は有効列としてカウントする。
              row << u
            elsif f.present?     # 退会者列の2段目が在籍であればその列は有効列としてカウントする。
              row << u
            elsif g.present?     # 退会者列の3段目が在籍であればその列は有効列としてカウントする。
              row << u
            elsif k.present?     # 退会者列の4段目が在籍であればその列は有効列としてカウントする。 
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
      
        point = Point.find_by(customer_id: h)
      
        if row.present?
          if row.length >= 7
            point["bns_#{@month}"] = my_pt.length * 50 + len1 * 40 + len2 * 30 + len3 * 20 + len4 * 10 + len5 * 5 + len6 * 3
          elsif row.length == 6
            point["bns_#{@month}"] = my_pt.length * 50 + len1 * 40 + len2 * 30 + len3 * 20 + len4 * 10 + len5 * 5
          elsif row.length == 5
            point["bns_#{@month}"] = my_pt.length * 50 + len1 * 40 + len2 * 30 + len3 * 20 + len4 * 10
          elsif row.length == 4
            point["bns_#{@month}"] = my_pt.length * 50 + len1 * 40 + len2 * 30 + len3 * 20
          elsif row.length == 3
            point["bns_#{@month}"] = my_pt.length * 50 + len1 * 40 + len2 * 30
          elsif row.length == 2
            point["bns_#{@month}"] = my_pt.length * 50 + len1 * 40
          else
            if row.length == 1
              point["bns_#{@month}"] = my_pt.length * 50
            end
          end
        else
          point["bns_#{@month}"] = 0
        end
           
        if @month <= 3
          point.cbns_1 = point.bns_1 + point.bns_2 + point.bns_3         #1クオーターのpt集計
        elsif (4 <= @month && @month <= 6)
          point.cbns_2 = point.bns_4 + point.bns_5 + point.bns_6        #2クオーターのpt集計
        elsif (7 <= @month && @month <= 9)
          point.cbns_3 = point.bns_7 + point.bns_8 + point.bns_9        #3クオーターのpt集計
        else
          point.cbns_4 = point.bns_10 + point.bns_11 + point.bns_12     #4クオーターのpt集計
        end 
        point.save
      end
    end
  end
  
  def self.point_reset       #テーブルのリセット
    po_reset = Point.select("customer_id").pluck(:customer_id)
    po_reset.each do |r|
      po_reset2 = Point.find_by(customer_id: r)
      po_reset2.bns_1 = 0
      po_reset2.bns_2 = 0
      po_reset2.bns_3 = 0
      po_reset2.cbns_1 = 0
      po_reset2.bns_4 = 0
      po_reset2.bns_5 = 0
      po_reset2.bns_6 = 0
      po_reset2.cbns_2 = 0
      po_reset2.bns_7 = 0
      po_reset2.bns_8 = 0
      po_reset2.bns_9 - 0
      po_reset2.cbns_3 = 0
      po_reset2.bns_10 = 0
      po_reset2.bns_11 = 0
      po_reset2.bns_12 = 0
      po_reset2.cbns_4 = 0
      po_reset2.save
    end
  end
end