class Customer::RecordsController < Customer::Base
  def individual
    render action: 'individual'
  end
  
  def bonus_record
    render action: 'bonus_record'
  end
  
  def bonus_title
    @customer = Customer.find_by(id: current_customer.id)
      time = Time.zone.now                                             # 現在の日時を取得
      month = time.month                                          # 現在の月を取得
    
    score = Score.find_by(customer_id: current_customer.id)    # ログインscoreレコード取得
    
    if month <= 3 
      sp1_qp = score.scc_1                               # 自分のscc_1のデータをduckへ代入
    elsif (4 <= month && month <= 6)  
      sp1_qp = score.scc_2                               # 自分のscc_2のデータをduckへ代入
    elsif (7 <= month && month <= 9)
      sp1_qp = score.scc_3                               # 自分のscc_3のデータをduckへ代入
    else
      sp1_qp = score.scc_4                               # 自分のscc_4のデータをduckへ代入
    end
    
    nickname = @customer.nickname
    customer_ids = Sponsor.where(sponsor1: nickname).pluck(:customer_id) #custom_id配列取得
    
    if customer_ids.empty? # 紹介者がいなければ
      @b_title = "ボーナス資格はありません"
    else  
      sp1_qp_ary = []
      customer_ids.each do |e|
        s1_q_point = Point.find_by(customer_id: e)
        if month <= 3
        sp1_qp_ary << s1_q_point.cbns_1 # pointテーブルの値を挿入。
        elsif (4 <= month && month <= 6)
          sp1_qp_ary << s1_q_point.cbns_2
        elsif (7 <= month && month <= 9)
          sp1_qp_ary << s1_q_point.cbns_3
        else
          sp1_qp_ary << s1_q_point.cbns_4
        end
    
        q_value = sp1_qp_ary.count { |val| val >= 20000 }
        
        if q_value < 3
          if sp1_qp < 4999
            @b_title = "ボーナス資格はありません"
          elsif (5000 <= sp1_qp && sp1_qp <= 19999)  
            @b_title = "ノーマル"
          else
            @b_title = "ベーシック"
          end
        
        elsif (3 <= q_value && q_value <= 4)
          @b_title = "クリスタルベーシック"
        elsif (5 <= q_value && q_value <= 6)
          @b_title = "シルバーベーシック"
        elsif (7 <= q_value && q_value <= 8)
          @b_title = "ゴールドベーシック"
        else
          @b_title = "プラチナベーシック"
        end
      end
    end
  end
  
  def sponsor_point
    @customer = Customer.find_by(id: current_customer.id)
    @myname = @customer.family_name + ' ' + @customer.given_name
    
    time = Time.zone.now
    @month = time.month
    mynickname = @customer.nickname
    @mysponsor = Customer.where(sponsor1: mynickname)
  end
  
  def bonus_point
    @customer = Customer.find_by(id: current_customer.id)
    @f_name = @customer.family_name + ' ' + @customer.given_name
    @n_name = @customer.nickname
    
    time = Time.zone.now
    @month = time.month
    
    unsub_register
    
    customer_ids = Sponsor.where(sponsor1:@n_name).pluck(:customer_id)
    
    customer_ids1 = Sponsor.where(sponsor1:@n_name).where.not(customer_id: [@unsub]).pluck(:customer_id)
     
    # 列の在籍者のチェック
    enro1 = customer_ids - customer_ids1
    
    if customer_ids == customer_ids1
      sp1_len = customer_ids1.length
      
    else
      enro1.each do |t|
        enro2 = Customer.find_by(id: t)
        @nickname = enro2.nickname
        enrollment_check
        
        # 退会者の１段目のチェック
        if @enroll1.present? 
          row1 = customer_ids1 << t
          sp1_len = row1.length
          
        # ２段目のチェック
        elsif @enroll2.present? 
          row2 = customer_ids1 << t
          sp1_len = row2.length
          
        # ３段目のチェック
        elsif @enroll3.present? 
          row3 = customer_ids1 << t
          sp1_len = row3.length 
          
        # 4段目のチェック
        elsif @enroll4.present?
          row4 = customer_ids1 << t
          sp1_len = row4.length 
          
        # 5段目のチェック
        elsif @emroll5.present?  
          row5 = customer_ids1 << t
          sp1_len = row5.length
          
        # ６段目のチェック
        elsif @enroll6.present? 
          row6 = customer_ids1 << t
          sp1_len = row6.length          

        # ７段目のチェック
        elsif @enroll7.present?
          row7 = customer_ids1 << t
          @sp1_len = row7.length
        else
          row = customer_ids1
          sp1_len = row.length
        end
      end
    end
    
    rc_len1 = Sponsor.where(sponsor1: @n_name).where.not(customer_id: [@unsub]).count    # ログイン者1段目紹介者人数取得
     
    rc_len2 = Sponsor.where(sponsor2: @n_name).where.not(customer_id: [@unsub]).count    # ログイン者2段目紹介者人数取得
      
    rc_len3 = Sponsor.where(sponsor3: @n_name).where.not(customer_id: [@unsub]).count    # ログイン者3段目紹介者人数取得
      
    rc_len4 = Sponsor.where(sponsor4: @n_name).where.not(customer_id: [@unsub]).count    # ログイン者4段目紹介者人数取得
     
    rc_len5 = Sponsor.where(sponsor5: @n_name).where.not(customer_id: [@unsub]).count    # ログイン者5段目紹介者人数取得
     
    rc_len6 = Sponsor.where(sponsor6: @n_name).where.not(customer_id: [@unsub]).count    # ログイン者6段目紹介者人数取得
    
    rc_len7 = Sponsor.where(sponsor7: @n_name).where.not(customer_id: [@unsub]).count    # ログイン者6段目紹介者人数取得
     
    if sp1_len == nil
      @b_people = 0
    elsif sp1_len == 1
      @b_people = rc_len1                              
    elsif sp1_len == 2
      @b_people = rc_len1 + rc_len2
    elsif sp1_len == 3
      @b_people = rc_len1 + rc_len2 + rc_len3
    elsif sp1_len == 4
      @b_people = rc_len1 + rc_len2 + rc_len3 + rc_len4                        
    elsif sp1_len == 5
      @b_people = rc_len1 + rc_len2 + rc_len3 + rc_len4 + rc_len5                         
    elsif sp1_len == 6
      @b_people = rc_len1 + rc_len2 + rc_len3 + rc_len4 + rc_len5 + rc_len6      
    else
      @b_people = rc_len1 + rc_len2 + rc_len3 + rc_len4 + rc_len5 + rc_len6 + rc_len7      
    end
  end
  
  def bonus_money
    @customer = Customer.find_by(id: current_customer.id)
    time = Time.zone.now     # 現在の日時を取得
    month = time.month       # 現在の月を取得
  
    score = Score.find_by(customer_id: current_customer.id) #ｐｔレコード取得
    
    nickname = @customer.nickname
    customer_ids = Sponsor.where(sponsor1: nickname).pluck(:customer_id) #紹介者のcustom_id配列で取得
    
    # 自分の紹介列のptを取り出しidを配列に代入する。
    sp1_qp_ary = []
    customer_ids.each do |e|
      sp_score = Point.find_by(customer_id: e)
      if month <= 3
        sp1_qp_ary << sp_score.cbns_1
      elsif (4 <= month && month <= 6)
        sp1_qp_ary << sp_score.cbns_2
      elsif (7 <= month && month <= 9)
        sp1_qp_ary << sp_score.cbns_3
      else
        sp1_qp_ary << sp_score.cbns_4
      end
    end
    
    # 20000pt以上の列の数をチェック
    q_value = sp1_qp_ary.count { |val| val >= 20000 }
    
    # 自分のクオーターptを取得
    if month <= 3 
      b_money = score.scc_1      # 自分のcbns_1のデータを@b_moneyへ代入
    elsif (4 <= month && month <= 6)  
      b_money = score.scc_2      # 自分のcbns_2のデータを@b_moneyへ代入
    elsif (7 <= month && month <= 9)
      b_money = score.scc_3      # 自分のcbns_3のデータを@b_moneyへ代入
    else
      b_money = score.scc_4      # 自分のcbns_4のデータを@b_moneyへ代入
    end
    
    # クオーター人数取り出し
    member = Member.find_by(customer_id: current_customer.id)
    if month <= 3
      cmem = member.mbc_1 
    elsif (4 <= month && month <= 6)
      cmem = member.mbc_2 
    elsif (7 <= month && month <= 9)
      cmem = member.mbc_3
    else
      cmem = member.mbc_4
    end
    
    # タイトル表示と金額表示
    if q_value < 3
      if b_money <= 4999
        @b_money3 = 0
        @b_title = "ボーナス資格はありません"
      elsif (5000 <= b_money && b_money <= 19999)  
        @b_title = "ノーマル"
        @b_money3 = cmem * 15
      else
        @b_title = "ベーシック"
        @b_money3 = cmem * 13
      end
    elsif (3 <= q_value && q_value <= 4)
      @b_title = "クリスタルベーシック"
      @b_money3 = cmem * 12
    elsif (5 <= q_value && q_value <= 6)
      @b_title = "シルバーベーシック"
      @b_money3 = cmem * 11
    elsif (7 <= q_value && q_value <= 8)
      @b_title = "ゴールドベーシック"
      @b_money3 = cmem * 10
    else
      @b_title = "プラチナベーシック"
      @b_money3 = cmem * 9
    end
    
     # 手数料差し引き金額の算出と表示
    if @b_money3 < 700
      @b_money1 = 0
      @b_money2 = "ボーナスは発生しません。"
    elsif (700 <= @b_money3 && @b_money3 < 30000)
      @b_money1 = @b_money3 - 700
    else
      @b_money1 = @b_money3 - 1000
    end
    
    if month <= 11
      @b_month = month + 1
    else
      @b_money = 1
    end
  end
  
  def quarter_point
    @customer = Customer.find_by(id: current_customer.id)
    time = Time.zone.now              # 現在の日時を取得
    @month = time.month                # 現在の月を取得
    score = Score.find_by(customer_id: current_customer.id)  # ログイン中scoreレコード取得
     
    unsub_register
    
    if @month <= 3 
      @q_point = score.scc_1       # scc_1のデータを@q_pointへ代入
      member = Member.find_by(customer_id: current_customer.id)
      @all_q_point = member.mbc_1
    elsif (4 <= @month && @month <= 6)  
      @q_point = score.scc_2       # scc_2のデータを@q_pointへ代入
      member = Member.find_by(customer_id: current_customer.id)
      @all_q_point = member.mbc_2
    elsif (7 <= @month && @month <= 9)
      @q_point = score.scc_3       # scc_3のデータを@q_pointへ代入
      member = Member.find_by(customer_id: current_customer.id)
      @all_q_point = member.mbc_3
    else
      @q_point = score.scc_4       # scc_4のデータを@q_pointへ代入
      member = Member.find_by(customer_id: current_customer.id)
      @all_q_point = member.mbc_4
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
  
  def privilege_title
    render action: 'privilege_title'
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
