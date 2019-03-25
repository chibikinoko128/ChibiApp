class Customer::CustomerYearForm
  include ActiveModel::Model

  attr_accessor :customer_year 
  delegate :persisted?, :save, to: :customer_year
  
  def initialize(customer_year = nil)
    @customer_year = customer_year
    @customer_year ||= CustomerYear.new
  end
  
  def assign_attributes(params = {})
    @params = params
    customer_year.assign_attributes(customer_year_params)
  end
  
  private
  def customer_year_params
    @params.require(:customer_year).permit(:year_check)
  end
end