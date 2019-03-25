class Customer::NumberForm
  include ActiveModel::Model

  attr_accessor :number
  delegate :persisted?, :save, to: :number
  
  def initialize(number = nil)
    @number = number
    @number ||= Number.new
  end
  
  def assign_attributes(params = {})
    @params = params
    number.assign_attributes(number_params)
  end
  
  private
  def number_params
    @params.require(:number).permit(:entries_month, :entries_week, :entries_day)
  end
end