class BankMail
  def self.absence_registration
    time = Time.zone.now
    @month = time.month
    
    bank = Bank.where(bk_name: "").pluck(:customer_id)
    if bank.present?
      bank.each do |n|
        register = Register.find_by(customer_id: n)
        if @month == 1
          if register.rg_1 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        elsif @month == 2
          if register.rg_2 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        elsif @month == 3
          if register.rg_3 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        elsif @month == 4
          if register.rg_4 == "在籍"
          user = Customer.find_by(id: n)
          BankMailer.registration(user).deliver_now
          end
        elsif @month == 5
          if register.rg_5 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        elsif @month == 6
          if register.rg_6 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        elsif @month == 7
          if register.rg_7 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        elsif @month == 8
          if register.rg_8 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        elsif @month == 9
          if register.rg_9 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        elsif @month == 10
          if register.rg_10 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        elsif @month == 11
          if register.rg_11 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        else 
          if register.rg_12 == "在籍"
            user = Customer.find_by(id: n)
            BankMailer.registration(user).deliver_now
          end
        end
      end
    end
  end
end