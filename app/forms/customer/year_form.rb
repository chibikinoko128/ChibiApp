class Customer::YearForm
  include ActiveModel::Model

  attr_accessor :year 
  delegate :persisted?, :save, to: :year
  
  def initialize(year = nil)
    @year = year
    @year ||= Year.new
  end
  
  def assign_attributes(params = {})
    @params = params
    year.assign_attributes(year_params)
  end
  
  private
  def year_params
    @params.require(:year).permit(:year_check)
  end
end