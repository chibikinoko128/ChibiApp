class Staff::TwentyFiveForm
  include ActiveModel::Model

  attr_accessor :twenty_five 
  delegate :persisted?, :save, to: :twenty_five
  
  def initialize(twenty_five = nil)
    @twenty_five = twenty_five
    @twenty_five ||= TwentyFive.new
  end
  
  def assign_attributes(params = {})
    @params = params
    twenty_five.assign_attributes(twenty_five_params)
  end
  
  private
  def twenty_five_params
    @params.require(:twenty_five).permit(:m_1, :m_2, :m_3, :c_1, :m_4, :m_5, :m_6, :c_2, :m_7, :m_8, :m_9, :c_3, :m_10, :m_11, :m_12, :c_4, :transfer_m_1, :transfer_m_2, :transfer_m_3, :transfer_c_1, :transfer_m_4, :transfer_m_5, :transfer_m_6, :transfer_c_2, :transfer_m_7, :transfer_m_8, :transfer_m_9, :transfer_c_3, :transfer_m_10, :transfer_m_11, :transfer_m_12, :transfer_c_4)
  end
end