class Customer::TwentySevensController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    @twenty_seven = TwentySeven.find_by(Customer_id: current_customer.id)
    @m_1 = @twenty_seven.m_1
    @m_2 = @twenty_seven.m_2
    @m_3 = @twenty_seven.m_3
    @c_1 = @twenty_seven.c_1
    @m_4 = @twenty_seven.m_4
    @m_5 = @twenty_seven.m_5
    @m_6 = @twenty_seven.m_6
    @c_2 = @twenty_seven.c_2
    @m_7 = @twenty_seven.m_7
    @m_8 = @twenty_seven.m_8
    @m_9 = @twenty_seven.m_9
    @c_3 = @twenty_seven.c_3
    @m_10 = @twenty_seven.m_10
    @m_11 = @twenty_seven.m_11
    @m_12 = @twenty_seven.m_12
    @c_4 = @twenty_seven.c_4
    @total = @twenty_seven.total
    @sp_1 = @twenty_seven.pt_special_1
    @sp_2 = @twenty_seven.pt_special_2
    @sp_3 = @twenty_seven.pt_special_3
    @sp_4 = @twenty_seven.pt_special_4
    @sp_5 = @twenty_seven.pt_special_5
    @sp_6 = @twenty_seven.pt_special_6
    @sp_7 = @twenty_seven.pt_special_7
    @sp_8 = @twenty_seven.pt_special_8
    @sp_9 = @twenty_seven.pt_special_9
    @sp_10 = @twenty_seven.pt_special_10
    @sp_11 = @twenty_seven.pt_special_11
    @sp_12 = @twenty_seven.pt_special_12
  end
end
