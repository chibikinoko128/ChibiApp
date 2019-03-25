class Customer::EighteensController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    
    @eighteen = Eighteen.find_by(Customer_id: current_customer.id)
    @m_1 = @eighteen.m_1
    @m_2 = @eighteen.m_2
    @m_3 = @eighteen.m_3
    @c_1 = @eighteen.c_1
    @m_4 = @eighteen.m_4
    @m_5 = @eighteen.m_5
    @m_6 = @eighteen.m_6
    @c_2 = @eighteen.c_2
    @m_7 = @eighteen.m_7
    @m_8 = @eighteen.m_8
    @m_9 = @eighteen.m_9
    @c_3 = @eighteen.c_3
    @m_10 = @eighteen.m_10
    @m_11 = @eighteen.m_11
    @m_12 = @eighteen.m_12
    @c_4 = @eighteen.c_4
    @total = @eighteen.total
    @sp_1 = @eighteen.pt_special_1
    @sp_2 = @eighteen.pt_special_2
    @sp_3 = @eighteen.pt_special_3
    @sp_4 = @eighteen.pt_special_4
    @sp_5 = @eighteen.pt_special_5
    @sp_6 = @eighteen.pt_special_6
    @sp_7 = @eighteen.pt_special_7
    @sp_8 = @eighteen.pt_special_8
    @sp_9 = @eighteen.pt_special_9
    @sp_10 = @eighteen.pt_special_10
    @sp_11 = @eighteen.pt_special_11
    @sp_12 = @eighteen.pt_special_12
  end
end
