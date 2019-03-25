class Staff::RecordsController < Staff::Base
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
    
    nickname = @customer.nickname
    customer_ids = Sponsor.where(sponsor1: nickname).pluck(:customer_id) #custom_id配列取得
    
    sp1_qp_ary = []
    customer_ids.each do |e|
      s1_q_point = Score.find_by(customer_id: e)
      if month <= 3
       sp1_qp_ary << s1_q_point.scc_1
      elsif (4 <= month && month <= 6)
        sp1_qp_ary << s1_q_point.scc_2
      elsif (7 <= month && month <= 9)
        sp1_qp_ary << s1_q_point.scc_3
      else
        sp1_qp_ary << s1_q_point.scc_4
      end
    
    
      q_value = sp1_qp_ary.count { |val| val >= 20000 }
    
      if month <= 3 
        sp1_qp = score.scc_1                               # 自分のscc_1のデータをduckへ代入
      elsif (4 <= month && month <= 6)  
        sp1_qp = score.scc_2                               # 自分のscc_2のデータをduckへ代入
      elsif (7 <= month && month <= 9)
        sp1_qp = score.scc_3                               # 自分のscc_3のデータをduckへ代入
      else
        sp1_qp = score.scc_4                               # 自分のscc_4のデータをduckへ代入
      end
   
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
  
  def sponsor_point
    @customer = Customer.find_by(id: current_customer.id)
    time = Time.zone.now
    @month = time.month
    mynickname = @customer.nickname
    
    @mysponsor = Customer.where(sponsor1: mynickname).pluck(:id)
    
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
        
        # １段目のチェック
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
    elsif q_value <= 4
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
    elsif (700 <= @b_money3 && @b_money < 30000)
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
    elsif (4 <= @month && @month <= 6)  
      @q_point = score.scc_2       # scc_2のデータを@q_pointへ代入
    elsif (7 <= @month && @month <= 9)
      @q_point = score.scc_3       # scc_3のデータを@q_pointへ代入
    else
      @q_point = score.scc_4       # scc_4のデータを@q_pointへ代入
    end
    
   
    nickname = @customer.nickname                                    # ログイン者のニックネーム取得
    rc_len1 = Sponsor.where(sponsor1: nickname).where.not(customer_id: [@unsub]).count         # ログイン者1段目紹介者人数取得
    rc_len2 = Sponsor.where(sponsor2: nickname).where.not(customer_id: [@unsub]).count         # ログイン者2段目紹介者人数取得
    rc_len3 = Sponsor.where(sponsor3: nickname).where.not(customer_id: [@unsub]).count         # ログイン者3段目紹介者人数取得
    rc_len4 = Sponsor.where(sponsor4: nickname).where.not(customer_id: [@unsub]).count         # ログイン者4段目紹介者人数取得
    rc_len5 = Sponsor.where(sponsor5: nickname).where.not(customer_id: [@unsub]).count         # ログイン者5段目紹介者人数取得
    rc_len6 = Sponsor.where(sponsor6: nickname).where.not(customer_id: [@unsub]).count         # ログイン者6段目紹介者人数取得
    rc_len7 = Sponsor.where(sponsor7: nickname).where.not(customer_id: [@unsub]).count         # ログイン者7段目紹介者人数取得
    
    row1 = rc_len1 * 50
    row2 = rc_len2 * 40
    row3 = rc_len3 * 30
    row4 = rc_len4 * 20
    row5 = rc_len5 * 10
    row6 = rc_len6 * 5
    row7 = rc_len7 * 3
    @all_q_point = row1 + row2 + row3 + row4 + row5 + row6 + row7
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
  
  def customer_pegasus
    time = Time.zone.now
    @year = time.year
    
    if @year >= 2019
      if time.month >= 3
        @year = time.year
      end
    end
    
    pegasus = Special.where(pegasus: 1).order("customer_id").page(params[:page])
    @customer_pegasus = []
    pegasus.each do |d|
      e = d.customer_id
      record = Special.find_by(customer_id: e)
      if record.phoenix == 1
      elsif record.queen == 1
      elsif record.king == 1
      elsif record.president == 1
      else
        @customer_pegasus << Customer.find_by(id: e)
      end
    end
  end
    
  def customer_phoenix
    time = Time.zone.now
    @year = time.year
    
    if @year >= 2019
      if time.month >= 3
        @year = time.year
      end
    end
    
    phoenix = Special.where(phoenix: 1).order("customer_id").page(params[:page])
    @customer_phoenix = []
    phoenix.each do |d|
      e = d.customer_id
      record = Special.find_by(customer_id: e)
      if record.queen == 1
      elsif record.king == 1
      elsif record.president == 1
      else
        @customer_phoenix << Customer.find_by(id: e)
      end
    end
  end
    
  def customer_queen
    time = Time.zone.now
    @year = time.year
    
    if @year >= 2019
      if time.month >= 3
        @year = time.year
      end
    end
    
    queen = Special.where(queen: 1).order("customer_id").page(params[:page])
    @customer_queen = []
    queen.each do |d|
      e = d.customer_id
      record = Special.find_by(customer_id: e)
      if record.king == 1
      elsif record.president == 1
      else
        @customer_queen << Customer.find_by(id: e)
      end
    end
  end
    
  def customer_king
    time = Time.zone.now
    @year = time.year
    
    if @year >= 2019
      if time.month >= 3
        @year = time.year
      end
    end
    
    king = Special.where(king: 1).order("customer_id").page(params[:page])
    @customer_king = []
    king.each do |d|
      e = d.customer_id
      record = Special.find_by(customer_id: e)
      if record.president == 1
      else
        @customer_king << Customer.find_by(id: e)
      end
    end
  end
    
  def customer_president 
    time = Time.zone.now
    @year = time.year
    
    if @year >= 2019
      if time.month >= 3
        @year = time.year
      end
    end
    
    president = Special.where(president: 1).order("customer_id").page(params[:page])
    @customer_president = []
    president.each do |d|
      e = d.customer_id
      @customer_president << Customer.find_by(id: e)
    end
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
  
  def prefecture_member
    time = Time.zone.now
    @month = time.month
    
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
    
    @hokkaidou = HomeAddress.where(prefecture: "北海道").count
    @hokkaidou_now = HomeAddress.where(prefecture: "北海道").where.not(customer_id: [@unsub]).count
    
    @aomori = HomeAddress.where(prefecture: "青森県").count
    @aomori_now = HomeAddress.where(prefecture: "青森県").where.not(customer_id: [@unsub]).count
    
    @iwate = HomeAddress.where(prefecture: "岩手県").count
    @iwate_now = HomeAddress.where(prefecture: "岩手県").where.not(customer_id: [@unsub]).count
    
    @miyagi = HomeAddress.where(prefecture: "宮城県").count
    @miyagi_now = HomeAddress.where(prefecture: "宮城県").where.not(customer_id: [@unsub]).count
    
    @akita = HomeAddress.where(prefecture: "秋田県").count
    @akita_now = HomeAddress.where(prefecture: "秋田県").where.not(customer_id: [@unsub]).count
    
    @yamagata = HomeAddress.where(prefecture: "山形県").count
    @yamagata_now = HomeAddress.where(prefecture: "山形県").where.not(customer_id: [@unsub]).count
    
    @fukusima = HomeAddress.where(prefecture: "福島県").count
    @fukusima_now = HomeAddress.where(prefecture: "福島県").where.not(customer_id: [@unsub]).count
    
    @ibaraki = HomeAddress.where(prefecture: "茨城県").count
    @ibaraki_now = HomeAddress.where(prefecture: "茨城県").where.not(customer_id: [@unsub]).count
    
    @totigi = HomeAddress.where(prefecture: "栃木県").count
    @totigi_now = HomeAddress.where(prefecture: "栃木県").where.not(customer_id: [@unsub]).count
    
    @gunma = HomeAddress.where(prefecture: "群馬県").count
    @gunma_now = HomeAddress.where(prefecture: "群馬県").where.not(customer_id: [@unsub]).count
    
    @saitama = HomeAddress.where(prefecture: "埼玉県").count
    @saitama_now = HomeAddress.where(prefecture: "埼玉県").where.not(customer_id: [@unsub]).count
    
    @chiba = HomeAddress.where(prefecture: "千葉県").count
    @chiba_now = HomeAddress.where(prefecture: "千葉県").where.not(customer_id: [@unsub]).count
    
    @tokyo = HomeAddress.where(prefecture: "東京都").count
    @tokyo_now = HomeAddress.where(prefecture: "東京都").where.not(customer_id: [@unsub]).count
    
    @kanagawa = HomeAddress.where(prefecture: "神奈川県").count
    @kanagawa_now = HomeAddress.where(prefecture: "神奈川県").where.not(customer_id: [@unsub]).count
    
    @niigata = HomeAddress.where(prefecture: "新潟県").count
    @niigata_now = HomeAddress.where(prefecture: "新潟県").where.not(customer_id: [@unsub]).count
    
    @toyama = HomeAddress.where(prefecture: "富山県").count
    @toyama_now = HomeAddress.where(prefecture: "富山県").where.not(customer_id: [@unsub]).count
    
    @isikawa = HomeAddress.where(prefecture: "石川県").count
    @isikawa_now = HomeAddress.where(prefecture: "石川県").where.not(customer_id: [@unsub]).count
    
    @fukui = HomeAddress.where(prefecture: "福井県").count
    @fukui_now = HomeAddress.where(prefecture: "福井県").where.not(customer_id: [@unsub]).count
    
    @yamanasi = HomeAddress.where(prefecture: "山梨県").count
    @yamanasi_now = HomeAddress.where(prefecture: "山梨県").where.not(customer_id: [@unsub]).count
    
    @nagano = HomeAddress.where(prefecture: "長野県").count
    @nagano_now = HomeAddress.where(prefecture: "長野県").where.not(customer_id: [@unsub]).count
    
    @gifu = HomeAddress.where(prefecture: "岐阜県").count
    @gifu_now = HomeAddress.where(prefecture: "岐阜県").where.not(customer_id: [@unsub]).count
    
    @sizuoka = HomeAddress.where(prefecture: "静岡県").count
    @sizuoka_now = HomeAddress.where(prefecture: "静岡県").where.not(customer_id: [@unsub]).count
    
    @aichi = HomeAddress.where(prefecture: "愛知県").count
    @aichi_now = HomeAddress.where(prefecture: "愛知県").where.not(customer_id: [@unsub]).count
    
    @mie = HomeAddress.where(prefecture: "三重県").count
    @mie_now = HomeAddress.where(prefecture: "三重県").where.not(customer_id: [@unsub]).count
    
    @siga = HomeAddress.where(prefecture: "滋賀県").count
    @siga_now = HomeAddress.where(prefecture: "滋賀県").where.not(customer_id: [@unsub]).count
    
    @kyoto = HomeAddress.where(prefecture: "京都府").count
    @kyoto_now = HomeAddress.where(prefecture: "京都府").where.not(customer_id: [@unsub]).count
    
    @oosaka = HomeAddress.where(prefecture: "大阪府").count
    @oosaka_now = HomeAddress.where(prefecture: "大阪府").where.not(customer_id: [@unsub]).count
    
    @hyogo = HomeAddress.where(prefecture: "兵庫県").count
    @hyogo_now = HomeAddress.where(prefecture: "兵庫県").where.not(customer_id: [@unsub]).count
    
    @nara = HomeAddress.where(prefecture: "奈良県").count
    @nara_now = HomeAddress.where(prefecture: "奈良県").where.not(customer_id: [@unsub]).count
    
    @wakayama = HomeAddress.where(prefecture: "和歌山県").count
    @wakayama_now = HomeAddress.where(prefecture: "和歌山県").where.not(customer_id: [@unsub]).count
    
    @tottori = HomeAddress.where(prefecture: "鳥取県").count
    @tottori_now = HomeAddress.where(prefecture: "鳥取県").where.not(customer_id: [@unsub]).count
    
    @simane = HomeAddress.where(prefecture: "島根県").count
    @simane_now = HomeAddress.where(prefecture: "島根県").where.not(customer_id: [@unsub]).count
    
    @okayama = HomeAddress.where(prefecture: "岡山県").count
    @okayama_now = HomeAddress.where(prefecture: "岡山県").where.not(customer_id: [@unsub]).count
    
    @hirosima = HomeAddress.where(prefecture: "広島県").count
    @hirosima_now = HomeAddress.where(prefecture: "広島県").where.not(customer_id: [@unsub]).count
    
    @yamaguchi = HomeAddress.where(prefecture: "山口県").count
    @yamaguchi_now = HomeAddress.where(prefecture: "山口県").where.not(customer_id: [@unsub]).count
    
    @tokusima = HomeAddress.where(prefecture: "徳島県").count
    @tokusima_now = HomeAddress.where(prefecture: "徳島県").where.not(customer_id: [@unsub]).count
    
    @kagawa = HomeAddress.where(prefecture: "香川県").count
    @kagawa_now = HomeAddress.where(prefecture: "香川県").where.not(customer_id: [@unsub]).count
    
    @ehime = HomeAddress.where(prefecture: "愛媛県").count
    @ehime_now = HomeAddress.where(prefecture: "愛媛県").where.not(customer_id: [@unsub]).count
    
    @kochi = HomeAddress.where(prefecture: "高知県").count
    @kochi_now = HomeAddress.where(prefecture: "高知県").where.not(customer_id: [@unsub]).count
    
    @fukuoka = HomeAddress.where(prefecture: "福岡県").count
    @fukuoka_now = HomeAddress.where(prefecture: "福岡県").where.not(customer_id: [@unsub]).count 
    
    @saga = HomeAddress.where(prefecture: "佐賀県").count
    @saga_now = HomeAddress.where(prefecture: "佐賀県").where.not(customer_id: [@unsub]).count
    
    @nagasaki = HomeAddress.where(prefecture: "長崎県").count
    @nagasaki_now = HomeAddress.where(prefecture: "長崎県").where.not(customer_id: [@unsub]).count
    
    @kumamoto = HomeAddress.where(prefecture: "熊本県").count
    @kumamoto_now = HomeAddress.where(prefecture: "熊本県").where.not(customer_id: [@unsub]).count
    
    @ooita = HomeAddress.where(prefecture: "大分県").count
    @ooita_now = HomeAddress.where(prefecture: "大分県").where.not(customer_id: [@unsub]).count
    
    @miyazaki = HomeAddress.where(prefecture: "宮崎県").count
    @miyazaki_now = HomeAddress.where(prefecture: "宮崎県").where.not(customer_id: [@unsub]).count
    
    @kagoshima = HomeAddress.where(prefecture: "鹿児島県").count
    @kagoshima_now = HomeAddress.where(prefecture: "鹿児島県").where.not(customer_id: [@unsub]).count
    
    @okinawa = HomeAddress.where(prefecture: "沖縄県").count
    @okinawa_now = HomeAddress.where(prefecture: "沖縄県").where.not(customer_id: [@unsub]).count
    
  end
  
  def not_payment
    time = Time.zone.now
    @month = time.month
    if @month <= 11
      @next_month = @month + 1
    else
      @next_month = 1
    end
    
    if @month == 1
      @sub = Register.where(rg_1: "在籍").page(params[:page])
      sub_not = Register.where(rg_1: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_2: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 2
      @sub = Register.where(rg_2: "在籍").page(params[:page])
      sub_not = Register.where(rg_2: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_3: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 3
      @sub = Register.where(rg_3: "在籍").page(params[:page])
      sub_not = Register.where(rg_3: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_4: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 4
      @sub = Register.where(rg_4: "在籍").page(params[:page])
      sub_not = Register.where(rg_4: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_5: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 5
      @sub = Register.where(rg_5: "在籍").page(params[:page])
      sub_not = Register.where(rg_5: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_6: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 6
      @sub = Register.where(rg_6: "在籍").page(params[:page])
      sub_not = Register.where(rg_6: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_7: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 7
      @sub = Register.where(rg_7: "在籍").page(params[:page])
      sub_not = Register.where(rg_7: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_8: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 8
      @sub = Register.where(rg_8: "在籍").page(params[:page])
      sub_not = Register.where(rg_8: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_9: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 9
      @sub = Register.where(rg_9: "在籍").page(params[:page])
      sub_not = Register.where(rg_9: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_10: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 10
      @sub = Register.where(rg_10: "在籍").page(params[:page])
      sub_not = Register.where(rg_10: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_11: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    elsif @month == 11
      @sub = Register.where(rg_11: "在籍").page(params[:page])
      sub_not = Register.where(rg_11: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_12: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    else 
      @sub = Register.where(rg_12: "在籍").page(params[:page])
      sub_not = Register.where(rg_12: "退会").pluck(:customer_id)
      @next_sub = Register.where(rg_1: "退会").where.not(customer_id: [sub_not]).pluck(:customer_id)
    end
  end
  
  def cash_back
    cash = StaffMonth.find(1)
    @year = cash.retrieval_year
    @month = cash.retrieval_month
    if @year == "2018"
      @check_year = Eighteen
      cacheback_member_sub
    elsif @year == "2019"
      @check_year = Nineteen
      cacheback_member_sub
    elsif @year == "2020"
      @check_year = Twentie
      cacheback_member_sub
    elsif @year == "2021"
      @check_year = One
      cacheback_member_sub
    elsif @year == "2022"
      @check_year = TwentyTwo
      cacheback_member_sub
    elsif @year == "2023"
      @check_year = TwentyThree
      cacheback_member_sub
    elsif @year == "2024"
      @check_year = TwentyFour
      cacheback_member_sub
    elsif @year == "2025"
      @check_year = TwentyFive
      cacheback_member_sub
    elsif @year == "2026"
      @check_year = TwentySix
      cacheback_member_sub
    else
      if @year == "2027"
        @check_year = TwentySeven
        cacheback_membe_sub
      end
    end
  end

  def cacheback_member_sub
    if @month == "1"
      @cacheback_member = @check_year.where("m_1 > 0").page(params[:page])
     
    elsif @month == "2"
      @cacheback_member = @check_year.where("m_2 > 0").page(params[:page])
     
    elsif @month == "3"
      @cacheback_member = @check_year.where("m_3 > 0").page(params[:page])
      
    elsif @month == "4"
      @cacheback_member = @check_year.where("m_4 > 0").page(params[:page])
      @abc = @check_year.where("m_4 > 0").pluck(:customer_id)  
    elsif @month == "5"
      @cacheback_member = @check_year.where("m_5 > 0").page(params[:page])
     
    elsif @month == "6"
      @cacheback_member = @check_year.where("m_6 > 0").page(params[:page])
     
    elsif @month == "7"
      @cacheback_member = @check_year.where("m_7 > 0").page(params[:page])
      
    elsif @month == "8"
      @cacheback_member = @check_year.where("m_8 > 0").page(params[:page])
      
    elsif @month == "9"
      @cacheback_member = @check_year.where("m_9 > 0").page(params[:page])
      
    elsif @month == "10"
      @cacheback_member = @check_year.where("m_10 > 0").page(params[:page])
      
    elsif @month == "11"
      @cacheback_member = @check_year.where("m_11 > 0").page(params[:page])
      
    else
      @cacheback_member = @check_year.where("m_12 > 0").page(params[:page])
      
    end
  end
      
  
  def quarter_bonus
    bonus = StaffQuarter.find(1)
    @year = bonus.bonus_year
    @quarter = bonus.bonus_quarter
    
    if @year == "2018"
      @check_year = Eighteen
      check_quarter
      
    elsif @year == "2019"
      @check_year = Nineteen
      check_quarter
      
    elsif @year == "2020"
      @check_year = Twentie
      check_quarter
      
    elsif @year == "2021"
      @check_year = One
      check_quarter
      
    elsif @year == "2022"
      @check_year = TwentyTwo
      check_quarter
      
    elsif @year == "2023"
      @check_year = TwentyThree
      check_quarter
      
    elsif @year == "2024"
      @check_year = TwentyFour
      check_quarter
      
    elsif @year == "2025"
      @check_year = TwentyFive
      check_quarter
      
    elsif @year == "2026"
      @check_year = TwentySix
      check_quarter
      
    else
      if @year == "2027"
        @check_year = TwentySeven
        check_quarter
      end
    end
  end
  
  def check_quarter
    if @quarter == "1"
      @bonus_member = @check_year.where("c_1 > 0").page(params[:page])
    elsif @quarter == "2"
      @bonus_member = @check_year.where("c_2 > 0").page(params[:page])
    elsif @quarter == "3"
      @bonus_member = @check_year.where("c_3 > 0").page(params[:page])
    else
      @bonus_member = @check_year.where("c_4 > 0").page(params[:page])
    end
  end
end


