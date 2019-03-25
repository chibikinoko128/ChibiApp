class Customer::SeventeensController < Customer::Base
  def show
    @customer = Customer.find_by(id: current_customer.id)
    perfo = Seventeen.where(customer_id: current_customer.id)
    if perfo.empty?
      seven = @customer.build_seventeen
      seven.save
    end
    @seventeen = Seventeen.find_by(Customer_id: current_customer.id)
    @m_1 = @seventeen.m_1
    @m_2 = @seventeen.m_2
    @m_3 = @seventeen.m_3
    @c_1 = @seventeen.c_1
    @m_4 = @seventeen.m_4
    @m_5 = @seventeen.m_5
    @m_6 = @seventeen.m_6
    @c_2 = @seventeen.c_2
    @m_7 = @seventeen.m_7
    @m_8 = @seventeen.m_8
    @m_9 = @seventeen.m_9
    @c_3 = @seventeen.c_3
    @m_10 = @seventeen.m_10
    @m_11 = @seventeen.m_11
    @m_12 = @seventeen.m_12
    @c_4 = @seventeen.c_4
    @total = @seventeen.total
  end
end

