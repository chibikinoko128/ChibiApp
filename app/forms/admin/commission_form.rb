class Admin::CommissionForm
  include ActiveModel::Model
  
  attr_accessor :commission
  delegate :persisted?, :save, to: :commission
  
  def initialize(commission = nil)
    @commission = commission
    @commission ||= Commission.new
  end
  
  def assign_attributes(params = {})
    @params = params
    commission.assign_attributes(commission_params)
  end
  
  private
  def commission_params
    @params.require(:commission).permit(:pay_bank, :bank_name, :fee_low, :fee_high)
  end
end