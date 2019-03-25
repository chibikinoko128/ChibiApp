class ExitEmail
  def self.email_clear
    time = Time.zone.now
    month = time.month
    exit_mail = Customer.where("email LIKE 'exit%'").pluck(:id)
    rg1_non = Register.where(rg_1: "在籍").pluck(:customer_id)
    rg2_non = Register.where(rg_2: "在籍").pluck(:customer_id)
    rg3_non = Register.where(rg_3: "在籍").pluck(:customer_id)
    rg4_non = Register.where(rg_4: "在籍").pluck(:customer_id)
    rg5_non = Register.where(rg_5: "在籍").pluck(:customer_id)
    rg6_non = Register.where(rg_6: "在籍").pluck(:customer_id)
    rg7_non = Register.where(rg_7: "在籍").pluck(:customer_id)
    rg8_non = Register.where(rg_8: "在籍").pluck(:customer_id)
    rg9_non = Register.where(rg_9: "在籍").pluck(:customer_id)
    rg10_non = Register.where(rg_10: "在籍").pluck(:customer_id)
    rg11_non = Register.where(rg_11: "在籍").pluck(:customer_id)
    rg12_non = Register.where(rg_12: "在籍").pluck(:customer_id)
    
    if month == 1
      sub = Register.where(rg_1: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 12
    elsif month == 2
      sub = Register.where(rg_2: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 1
    elsif month == 3
      sub = Register.where(rg_3: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 2
    elsif month == 4
      sub = Register.where(rg_4: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 3
    elsif month == 5
      sub = Register.where(rg_5: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 4
    elsif month == 6
      sub = Register.where(rg_6: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 5
    elsif month == 7
      sub = Register.where(rg_7: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 6
    elsif month == 8
      sub = Register.where(rg_8: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 7
    elsif month == 9
      sub = Register.where(rg_9: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 8
    elsif month == 10
      sub = Register.where(rg_10: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 9
    elsif month == 11
      sub = Register.where(rg_11: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 10
    else
      sub = Register.where(rg_12: "退会").where.not(id: [exit_mail]).pluck(:customer_id)
      clear = 11
    end
    
    if sub.present?
      sub.each do |m|
        unsub = Register.find_by(customer_id: m)
        if unsub["rg_#{clear}"] == "在籍"
          customer = Customer.find_by(id: m)
          customer.email = "&exit%$111" + customer.email
          customer.nickname = customer.nickname + "&exit%$222"
          customer.save
        end
      end
    end
      
    to = Time.zone.now.at_beginning_of_month
    from = (to - 1.year)
    abc = Customer.where(created_at: from..to).where.not(id: [exit_mail]).where.not(id: [rg1_non]).where.not(id: [rg2_non]).where.not(id: [rg3_non]).where.not(id: [rg4_non]).where.not(id: [rg5_non]).where.not(id: [rg6_non]).where.not(id: [rg7_non]).where.not(id: [rg8_non]).where.not(id: [rg9_non]).where.not(id: [rg10_non]).where.not(id: [rg11_non]).where.not(id: [rg12_non])

    if abc.present? #登録してから一年間、１回も在籍履歴が無い会員がいた場合
      abc.each do |e|
        t = e.created_at + 1.year #登録年月から一年
        f = Time.zone.now
        if f > t #登録してから一年以上経過していれば
          x = Register.find_by(customer_id: e.id)
          y = x.rg_1 + x.rg_2 + x.rg_3 + x.rg_4 + x.rg_5 + x.rg_6 + x.rg_7 + x.rg_8 + x.rg_9 + x.rg_10 + x.rg_11 + x.rg_12
          if y =~ /在籍/
          else
            customer = Customer.find_by(id: e.id)
            customer.email = "&exit%$111" + customer.email
            customer.nickname = customer.nickname + "&exit%$222"
            customer.save
          end
        end
      end
    end
    
    lock = Customer.where(lock: "1")
    lock.each do |l|
      l.lock = "0"
      l.save
    end
    
    bonus_lock = Customer.where(bonus_lock: "1")
    bonus_lock.each do |b|
      b.bonus_lock = "0" 
      b.save
    end
    
    special_lock = Customer.where(special_lock: "1")
    special_lock.each do |s|
      s.special_lock = "0"
      s.save
    end
  end
end