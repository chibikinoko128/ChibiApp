class Customer::OnesController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    @one = One.find_by(Customer_id: current_customer.id)
    @m_1 = @one.m_1
    @m_2 = @one.m_2
    @m_3 = @one.m_3
    @c_1 = @one.c_1
    @m_4 = @one.m_4
    @m_5 = @one.m_5
    @m_6 = @one.m_6
    @c_2 = @one.c_2
    @m_7 = @one.m_7
    @m_8 = @one.m_8
    @m_9 = @one.m_9
    @c_3 = @one.c_3
    @m_10 = @one.m_10
    @m_11 = @one.m_11
    @m_12 = @one.m_12
    @c_4 = @one.c_4
    @total = @one.total
    @sp_1 = @one.pt_special_1
    @sp_2 = @one.pt_special_2
    @sp_3 = @one.pt_special_3
    @sp_4 = @one.pt_special_4
    @sp_5 = @one.pt_special_5
    @sp_6 = @one.pt_special_6
    @sp_7 = @one.pt_special_7
    @sp_8 = @one.pt_special_8
    @sp_9 = @one.pt_special_9
    @sp_10 = @one.pt_special_10
    @sp_11 = @one.pt_special_11
    @sp_12 = @one.pt_special_12
  end
end
