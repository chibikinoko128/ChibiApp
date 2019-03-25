class Customer::TwentiesController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    @twentie = Twentie.find_by(Customer_id: current_customer.id)
    @m_1 = @twentie.m_1
    @m_2 = @twentie.m_2
    @m_3 = @twentie.m_3
    @c_1 = @twentie.c_1
    @m_4 = @twentie.m_4
    @m_5 = @twentie.m_5
    @m_6 = @twentie.m_6
    @c_2 = @twentie.c_2
    @m_7 = @twentie.m_7
    @m_8 = @twentie.m_8
    @m_9 = @twentie.m_9
    @c_3 = @twentie.c_3
    @m_10 = @twentie.m_10
    @m_11 = @twentie.m_11
    @m_12 = @twentie.m_12
    @c_4 = @twentie.c_4
    @total = @twentie.total
    @sp_1 = @twentie.pt_special_1
    @sp_2 = @twentie.pt_special_2
    @sp_3 = @twentie.pt_special_3
    @sp_4 = @twentie.pt_special_4
    @sp_5 = @twentie.pt_special_5
    @sp_6 = @twentie.pt_special_6
    @sp_7 = @twentie.pt_special_7
    @sp_8 = @twentie.pt_special_8
    @sp_9 = @twentie.pt_special_9
    @sp_10 = @twentie.pt_special_10
    @sp_11 = @twentie.pt_special_11
    @sp_12 = @twentie.pt_special_12
  end
end
