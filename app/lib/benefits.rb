class Benefits
  def self.my_special
    time = Time.zone.now
    @month = time.month
   
    if @month == 1
      @sub = Register.where(rg_1: "在籍").pluck(:customer_id)
    elsif @month == 2
      @sub = Register.where(rg_2: "在籍").pluck(:customer_id)
    elsif @month == 3
      @sub = Register.where(rg_3: "在籍").pluck(:customer_id)
    elsif @month == 4
      @sub = Register.where(rg_4: "在籍").pluck(:customer_id)
    elsif @month == 5
      @sub = Register.where(rg_5: "在籍").pluck(:customer_id)
    elsif @month == 6
      @sub = Register.where(rg_6: "在籍").pluck(:customer_id)
    elsif @month == 7
      @sub = Register.where(rg_7: "在籍").pluck(:customer_id)
    elsif @month == 8
      @sub = Register.where(rg_8: "在籍").pluck(:customer_id)
    elsif @month == 9
      @sub = Register.where(rg_9: "在籍").pluck(:customer_id)
    elsif @month == 10
      @sub = Register.where(rg_10: "在籍").pluck(:customer_id)
    elsif @month == 11
      @sub = Register.where(rg_11: "在籍").pluck(:customer_id)
    else
      @sub = Register.where(rg_12: "在籍").pluck(:customer_id)
    end
    
    @sub.each do |y|
      user = Customer.find_by(id: y)
      nickname = user.nickname
      @score = Score.find_by(customer_id: y)
      @special = Special.find_by(customer_id: y)
      sponsor = Sponsor.where(sponsor1: nickname).pluck(:customer_id)
      
      sp1_qp_ary = []
      sponsor.each do |j|
        sp_score = Point.find_by(customer_id: j)
        if @month == 4
          sp1_qp_ary << sp_score.cbns_1
        elsif @month == 7
          sp1_qp_ary << sp_score.cbns_2
        elsif @month == 10
          sp1_qp_ary << sp_score.cbns_3
        else
          if @month == 1
            sp1_qp_ary << sp_score.cbns_4
          end
        end
      end
      
      # 20000pt以上の列の数をチェック
      @q_value = sp1_qp_ary.count { |val| val >= 20000 }
      # タイトル表示と金額表示
      if @month == 4
        if @score.scc_1 >= 5000
          if @score.scc_1 >= 20000
            sp_title
            special_title
          end
        end
      elsif @month == 7
        if @score.scc_2 >= 5000
          if @score.scc_2 >= 20000
            sp_title
            special_title
          end
        end
      elsif @month == 10
        if @score.scc_3 >= 5000
          if @score.scc_3 >= 20000
            sp_title
            special_title
          end
        end
      else
        if @month == 1
          if @score.scc_4 >= 5000
            if @score.scc_4 >= 20000
              sp_title
              special_title
            end
          end
        end
      end 
      
      if @month == 1
        if @special.president == 1
          SpTitleMailer.president(user).deliver_now
        elsif @special.king == 1
          SpTitleMailer.king(user).deliver_now
        elsif @special.queen == 1
          SpTitleMailer.queen(user).deliver_now
        elsif @special.phoenix == 1
          SpTitleMailer.phoenix(user).deliver_now
        else
          if @special.pegasus == 1
            SpTitleMailer.pegasus(user).deliver_now
          end
        end
      end  
    end
  end
    
  def self.special_title
    if @special.basic >= 2
      @special.pegasus = 1
    end
    
    if @special.crystal >= 2
      @special.phoenix = 1
    end
    
    if @special.silver >= 2
      @special.queen = 1
    end
    
    if @special.gold >= 2
      @special.king = 1
    end
    
    if @special.platinum >= 2
      @special.president = 1
    end
    @special.save
  end
      
  def self.special_reset      #テーブルのリセット
    special_rst = Special.select("customer_id").pluck(:customer_id)
    special_rst.each do |h|
      special_rst2 = Special.find_by(customer_id: h)
      special_rst2.basic = 0
      special_rst2.crystal = 0
      special_rst2.silver = 0
      special_rst2.gold = 0
      special_rst2.platinum = 0
      special_rst2.pegasus = 0
      special_rst2.phoenix = 0
      special_rst2.queen = 0
      special_rst2.king = 0
      special_rst2.president = 0
      special_rst2.save
    end
  end
      
  def self.sp_title
    if @q_value < 3
      if @month == 4
        if @score.scc_1 >= 20000
          @special.basic = @special.basic + 1
        end
      elsif @month == 7
        if @score.scc_2 >= 20000
          @special.basic = @special.basic + 1
        end
      elsif @month == 10
        if @score.scc_3 >= 20000
          @special.basic = @special.basic + 1
        end
      else
        if @month == 1
          if @score.scc_4 >= 20000
            @special.basic = @special.basic + 1
          end
        end
      end
    
    elsif (3 <= @q_value && @q_value <= 4)  
      @special.crystal = @special.crystal + 1
    elsif (5 <= @q_value && @q_value <= 6)
      @special.silver = @special.silver + 1 
    elsif (7 <= @q_value && @q_value <= 8)
      @special.gold = @special.gold + 1
    else
      @special.platinum = @special.platinum + 1
    end
    @special.save
  end
end