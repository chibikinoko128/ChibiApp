class AchieveMail
  def self.achiev
    time = Time.zone.now
    @year = timw.year
    @month = time.month
    
    if @year == 2018
      if @month == 4
        @lucky = Eighteen.where("c_1 > 0" ).pluck(:customer_id)
        score_scc1
      elsif @month == 7
        @lucky = Eighteen.where("c_2 > 0" ).pluck(:customer_id)
        score_scc2
      elsif @month == 10
        @lucky = Eighteen.where("c_3 > 0" ).pluck(:customer_id)
        score_scc3
      elsif @month == 1
        @lucky = Eighteen.where("c_4 > 0" ).pluck(:customer_id)
        score_scc4
      end
    elsif @year == 2019
      if @month == 4
        @lucky = Nineteen.where("c_1 > 0" ).pluck(:customer_id)
        score_scc1
      elsif @month == 7
        @lucky = Nineteen.where("c_2 > 0" ).pluck(:customer_id)
        score_scc2
      elsif @month == 10
        @lucky = Nineteen.where("c_3 > 0" ).pluck(:customer_id)
        score_scc3
      elsif @month == 1
        @lucky = Eighteen.where("c_4 > 0" ).pluck(:customer_id)
        score_scc4
      end
    elsif @year == 2020
      if @month == 4
        @lucky = Twentie.where("c_1 > 0" ).pluck(:customer_id)
        score_scc1
      elsif @month == 7
        @lucky = Twentie.where("c_2 > 0" ).pluck(:customer_id)
        score_scc2
      elsif @month == 10
        @lucky = Twentie.where("c_3 > 0" ).pluck(:customer_id)
        score_scc3
      elsif @month == 1
        @lucky = Nineteen.where("c_4 > 0" ).pluck(:customer_id)
        score_scc4
      end
    elsif @year == 2021
      if @month == 4
        @lucky = One.where("c_1 > 0" ).pluck(:customer_id)
        score_scc1
      elsif @month == 7
        @lucky = One.where("c_2 > 0" ).pluck(:customer_id)
        score_scc2
      elsif @month == 10
        @lucky = One.where("c_3 > 0" ).pluck(:customer_id)
        score_scc3
      elsif @month == 1
        @lucky = Twentie.where("c_4 > 0" ).pluck(:customer_id)
        score_scc4
      end
    elsif @year == 2022
      if @month == 4
        @lucky = TwentyTwo.where("c_1 > 0" ).pluck(:customer_id)
        score_scc1
      elsif @month == 7
        @lucky = TwentyTwo.where("c_2 > 0" ).pluck(:customer_id)
        score_scc2
      elsif @month == 10
        @lucky = TwentyTwo.where("c_3 > 0" ).pluck(:customer_id)
        score_scc3
      elsif @month == 1
        @lucky = One.where("c_4 > 0" ).pluck(:customer_id)
        score_scc4
      end
    elsif @yera == 2023
      if @month == 4
        @lucky = TwentyThree.where("c_1 > 0" ).pluck(:customer_id)
        score_scc1
      elsif @month == 7
        @lucky = TwentyThree.where("c_2 > 0" ).pluck(:customer_id)
        score_scc2
      elsif @month == 10
        @lucky = TwentyThree.where("c_3 > 0" ).pluck(:customer_id)
        score_scc3
      elsif @month == 1
        @lucky = TwentyTwo.where("c_4 > 0" ).pluck(:customer_id)
        score_scc4
      end
    elsif @year == 2024
      if @month == 4
        @lucky = TwentyFour.where("c_1 > 0" ).pluck(:customer_id)
        score_scc1
      elsif @month == 7
        @lucky = TwentyFour.where("c_2 > 0" ).pluck(:customer_id)
        score_scc2
      elsif @month == 10
        @lucky = TwentyFour.where("c_3 > 0" ).pluck(:customer_id)
        score_scc3
      elsif @month == 1
        @lucky = TwentyThree.where("c_4 > 0" ).pluck(:customer_id)
        score_scc4
      end
    elsif @year == 2025
      if @month == 4
        @lucky = TwentyFive.where("c_1 > 0" ).pluck(:customer_id)
        score_scc1
      elsif @month == 7
        @lucky = TwentyFive.where("c_2 > 0" ).pluck(:customer_id)
        score_scc2
      elsif @month == 10
        @lucky = TwentyFive.where("c_3 > 0" ).pluck(:customer_id)
        score_scc3
      elsif @month == 1
        @lucky = TwentyFour.where("c_4 > 0" ).pluck(:customer_id)
        score_scc4
      end
    elsif @year == 2026
      if @month == 4
        @lucky = TwentySix.where("c_1 > 0" ).pluck(:customer_id)
        score_scc1
      elsif @month == 7
        @lucky = TwentySix.where("c_2 > 0" ).pluck(:customer_id)
        score_scc2
      elsif @month == 10
        @lucky = TwentySix.where("c_3 > 0" ).pluck(:customer_id)
        score_scc3
      elsif @month == 1
        @lucky = TwentyFive.where("c_4 > 0" ).pluck(:customer_id)
        score_scc4
      end
    else
      if @year == 2027
        if @month == 4
          @lucky = TwentySeven.where("c_1 > 0" ).pluc(:customer_id)
          score_scc1
        elsif @month == 7
          @lucky = TwentySeven.where("c_2 > 0" ).pluck(:customer_id)
          score_scc2
        elsif @month == 10
          @lucky = TwentySeven.where("c_3 > 0" ).pluck(:customer_id)
          score_scc3
        elsif @month == 1
          @lucky = TwentySix.where("c_4 > 0" ).pluck(:customer_id)
          score_scc4
        end
      end
    end
    
    if q_bonus.present?
      q_bonus.each do |ｗ|
        user = Customer.find_by(id: ｗ)
        BonusMailer.bonus_get(user).deliver_now
      end
    end
    
    if q_bonus1.present?
      q_bonus1.each do |z|
        user = Customer.find_by(id: ｗ)
        BonusMailer.bonus1_get(user).deliver_now
      end
    end
  end

  def score_scc1
    q_bonus = []
    q_bonus1 = []
    @lucky.each do |v|
      score = Score.find_by(customer_id: v)
      if score.scc_1 <= 700
      elsif score.scc_1 >= 30000
        q_bonus1 << v
      else
        q_bonus << v
      end
    end
  end

  def score_scc2
    q_bonus = []
    q_bonus1 = []
    @lucky.each do |v|
      score = Score.find_by(customer_id: v)
      if score.scc_2 <= 700
      elsif score.scc_2 >= 30000
        q_bonus1 << v
      else
        q_bonus << v
      end
    end
  end

  def score_scc3
    q_bonus = []
    q_bonus1 = []
    @lucky.each do |v|
      score = Score.find_by(customer_id: v)
      if score.scc_3 <= 700
      elsif score.scc_3 >= 30000
        q_bonus1 << v
      else
        q_bonus << v
      end
    end
  end

  def score_scc4
    q_bonus = []
    q_bonus1 = []
    @lucky.each do |v|
      score = Score.find_by(customer_id: v)
      if score.scc_4 <= 700
      elsif score.scc_4 >= 30000
        q_bonus1 << v
      else
        q_bonus << v
      end
    end
  end
end