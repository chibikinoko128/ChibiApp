class Customer::NineteensController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    
    @nineteen = Nineteen.find_by(Customer_id: current_customer.id)
    @m_1 = @nineteen.m_1
    @m_2 = @nineteen.m_2
    @m_3 = @nineteen.m_3
    @c_1 = @nineteen.c_1
    @m_4 = @nineteen.m_4
    @m_5 = @nineteen.m_5
    @m_6 = @nineteen.m_6
    @c_2 = @nineteen.c_2
    @m_7 = @nineteen.m_7
    @m_8 = @nineteen.m_8
    @m_9 = @nineteen.m_9
    @c_3 = @nineteen.c_3
    @m_10 = @nineteen.m_10
    @m_11 = @nineteen.m_11
    @m_12 = @nineteen.m_12
    @c_4 = @nineteen.c_4
    @total = @nineteen.total
    @sp_1 = @nineteen.pt_special_1
    @sp_2 = @nineteen.pt_special_2
    @sp_3 = @nineteen.pt_special_3
    @sp_4 = @nineteen.pt_special_4
    @sp_5 = @nineteen.pt_special_5
    @sp_6 = @nineteen.pt_special_6
    @sp_7 = @nineteen.pt_special_7
    @sp_8 = @nineteen.pt_special_8
    @sp_9 = @nineteen.pt_special_9
    @sp_10 = @nineteen.pt_special_10
    @sp_11 = @nineteen.pt_special_11
    @sp_12 = @nineteen.pt_special_12
  end
end
