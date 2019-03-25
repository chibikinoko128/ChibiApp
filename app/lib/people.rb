class People
  def self.my_member #ボーナス対象人数（月。クオーター）
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
    @sub.each do |z|
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
      
      spo_diff = Sponsor.where(sponsor1: @nick).where.not(customer_id: [@sub]).pluck(:customer_id)
      #１段目の退会者を取り出す。
      
      #1段目の在籍人数チェック
      if spo_diff.empty?              #１段目に退会者がいなければ
        len1                          # その在籍人数を有効列とする。
      else                            #１段目に退会者がいた場合
        spo_diff.each do |u|          # 1段目の退会者をイテレート  
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
            end                        #退会者列に在籍者がいない場合
          end
        end
      end
      
      member = Member.find_by(customer_id: z)
      if row.empty?
        member["mb_#{@month}"] = 0
      elsif row.length == 1
        member["mb_#{@month}"] = 1
      elsif row.length == 2
        member["mb_#{@month}"] = len1 + len2
      elsif row.length == 3
        member["mb_#{@month}"] = len1 + len2 + len3
      elsif row.length == 4
        member["mb_#{@month}"] = len1 + len2 + len3 + len4
      elsif row.length == 5
        member["mb_#{@month}"] = len1 + len2 + len3 + len4 + len5
      elsif row.length == 6
        member["mb_#{@month}"] = len1 + len2 + len3 + len4 + len5 + len6
      else
        member["mb_#{@month}"] = len1 + len2 + len3 + len4 + len5 + len6 + len7
      end
      
      if @month <= 3
        member.mbc_1 = member.mb_1 + member.mb_2 + member.mb_3       #1クオーターの人数集計
      elsif (4 <= @month && @month <= 6)
        member.mbc_2 = member.mb_4 + member.mb_5 + member.mb_6       #2クオーターの人数集計
      elsif (7 <= @month && @month <= 9)
        member.mbc_3 = member.mb_7 + member.mb_8 + member.mb_9       #3クオーターの人数集計
      else
        member.mbc_4 = member.mb_10 + member.mb_11 + member.mb_12    #4クオーターの人数集計
      end
      member.save
    end
  end
    
  def self.member_reset       #テーブルのリセット
    member_rst = Member.select("customer_id").pluck(:customer_id)
    member_rst.each do |v|
      member_rst2 = Member.find_by(customer_id: v)
      member_rst2.mb_1 = 0
      member_rst2.mb_2 = 0
      member_rst2.mb_3 = 0
      member_rst2.mbc_1 = 0
      member_rst2.mb_4 = 0
      member_rst2.mb_5 = 0
      member_rst2.mb_6 = 0
      member_rst2.mbc_2 = 0
      member_rst2.mb_7 = 0
      member_rst2.mb_8 = 0
      member_rst2.mb_9 - 0
      member_rst2.mbc_3 = 0
      member_rst2.mb_10 = 0
      member_rst2.mb_11 = 0
      member_rst2.mb_12 = 0
      member_rst2.mbc_4 = 0
      member_rst2.save
    end
  end
end
  