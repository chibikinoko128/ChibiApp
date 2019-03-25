class Admin::PayForm
  include ActiveModel::Model

  attr_accessor :pay 
  delegate :persisted?, :save, to: :pay
  
  def initialize(pay = nil)
    @pay = pay
    @pay ||= Pay.new
  end
  
  def assign_attributes(params = {})
    @params = params
    pay.assign_attributes(pay_params)
  end
  
  private
  def pay_params
    @params.require(:pay).permit(:year, :month, :quarter)
  end
end