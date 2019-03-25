class Yesterday
  def self.introduction
    sp_ary = Customer.where(created_at: 1.day.ago.all_day).pluck(:id)
    time = Time.zone.now
    month = time.month
    if month == 1
      @last_month = 12
    else
      @last_month = month - 1
    end
    
    if sp_ary.present?
      sp_ary.each do |t|
        score = Score.find_by(customer_id: t)
        if score["sc_#{@last_month}"] == 0
          sponsor = Sponsor.find_by(customer_id: t)
          customer1 = Customer.find_by(id: t)
          nickname1 = customer1.sponsor1  #tを紹介した人のニックネームA(１段上)
          
          customer2 = Customer.find_by(nickname: nickname1)  # tを紹介した人A（２段目のレコード）
          nickname2 = customer2.sponsor1  # Aを紹介した人のニックネームB(２段上)
        
          customer3 = Customer.find_by(nickname: nickname2)  # Bのレコード（３段目のレコード）
          nickname3 = customer3.sponsor1  # Bを紹介した人のニックネームC（３段上）
        
          customer4 = Customer.find_by(nickname: nickname3)  # Cのレコード（４段目のレコード）
          nickname4 = customer4.sponsor1  # Cを紹介した人のニックネームD（４段上）
        
          customer5 = Customer.find_by(nickname: nickname4)  # Dのレコード（５段目のレコード）
          nickname5 = customer5.sponsor1  # Dを紹介した人のニックネームE（５段上）
        
          customer6 = Customer.find_by(nickname: nickname5)  # Eのレコード（６段目のレコード）
          nickname6 = customer6.sponsor1  # Eを紹介した人のニックネームF（６段上）
      
          customer7 = Customer.find_by(nickname: nickname6)  # Fのレコード（７段目のレコード）
          nickname7 = customer7.sponsor1  # Fを紹介した人のニックネームG　（７段上）
        
          sponsor.sponsor1 = nickname1
          sponsor.sponsor2 = nickname2
          sponsor.sponsor3 = nickname3 
          sponsor.sponsor4 = nickname4
          sponsor.sponsor5 = nickname5
          sponsor.sponsor6 = nickname6
          sponsor.sponsor7 = nickname7
          sponsor.save
       
          if nickname2 == "sss"
            sponsor.sponsor2 = "dragon"
            sponsor.sponsor3 = "dragon"
            sponsor.sponsor4 = "dragon"
            sponsor.sponsor5 = "dragon"
            sponsor.sponsor6 = "dragon"
            sponsor.sponsor7 = "dragon"
            sponsor.save
          elsif nickname3 == "sss"
            sponsor.sponsor3 = "dragon"
            sponsor.sponsor4 = "dragon"
            sponsor.sponsor5 = "dragon"
            sponsor.sponsor6 = "dragon"
            sponsor.sponsor7 = "dragon"
            sponsor.save
          elsif nickname4 == "sss"
            sponsor.sponsor4 = "dragon"
            sponsor.sponsor5 = "dragon"
            sponsor.sponsor6 = "dragon"
            sponsor.sponsor7 = "dragon"
            sponsor.save
          elsif nickname5 == "sss"
            sponsor.sponsor5 = "dragon"
            sponsor.sponsor6 = "dragon"
            sponsor.sponsor7 = "dragon"
            sponsor.save
          elsif nickname6 == "sss"
            sponsor.sponsor6 = "dragon"
            sponsor.sponsor7 = "dragon"
            sponsor.save
          else
            if nickname7 == "sss"
              sponsor.sponsor7 = "dragon"
              sponsor.save
            end
          end
          score["sc_#{@last_month}"] = 1
          score.save
        end
      end 
    end
  end
end