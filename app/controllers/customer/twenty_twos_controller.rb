class Customer::TwentyTwosController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    @twenty_two = TwentyTwo.find_by(Customer_id: current_customer.id)
    @m_1 = @twenty_two.m_1
    @m_2 = @twenty_two.m_2
    @m_3 = @twenty_two.m_3
    @c_1 = @twenty_two.c_1
    @m_4 = @twenty_two.m_4
    @m_5 = @twenty_two.m_5
    @m_6 = @twenty_two.m_6
    @c_2 = @twenty_two.c_2
    @m_7 = @twenty_two.m_7
    @m_8 = @twenty_two.m_8
    @m_9 = @twenty_two.m_9
    @c_3 = @twenty_two.c_3
    @m_10 = @twenty_two.m_10
    @m_11 = @twenty_two.m_11
    @m_12 = @twenty_two.m_12
    @c_4 = @twenty_two.c_4
    @total = @twenty_two.total
    @sp_1 = @twenty_two.pt_special_1
    @sp_2 = @twenty_two.pt_special_2
    @sp_3 = @twenty_two.pt_special_3
    @sp_4 = @twenty_two.pt_special_4
    @sp_5 = @twenty_two.pt_special_5
    @sp_6 = @twenty_two.pt_special_6
    @sp_7 = @twenty_two.pt_special_7
    @sp_8 = @twenty_two.pt_special_8
    @sp_9 = @twenty_two.pt_special_9
    @sp_10 = @twenty_two.pt_special_10
    @sp_11 = @twenty_two.pt_special_11
    @sp_12 = @twenty_two.pt_special_12
  end
end
