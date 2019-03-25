class Admin::BankForm
  include ActiveModel::Model

  attr_accessor :bank 
  delegate :persisted?, :save, to: :bank
  
  def initialize(bank = nil)
    @bank = bank
    @bank ||= Bank.new
  end
  
  def assign_attributes(params = {})
    @params = params
    bank.assign_attributes(bank_params)
  end
  
  private
  def bank_params
    @params.require(:bank).permit(:bk_name, :office, :account, :bk_name_check, :office_check, :account_check, :web_registration)
  end
end