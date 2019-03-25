class Admin::RegisterForm
  include ActiveModel::Model

  attr_accessor :register 
  delegate :persisted?, :save, to: :register
  
  def initialize(register = nil)
    @register = register
    @register ||= Register.new
  end
  
  def assign_attributes(params = {})
    @params = params
    register.assign_attributes(register_params)
  end
  
  private
  def register_params
    @params.require(:register).permit(:rg_1, :rg_2, :rg_3, :rg_4, :rg_5, :rg_6, :rg_7, :rg_8, :rg_9, :rg_10, :rg_11, :rg_12)
  end
end