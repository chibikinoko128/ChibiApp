class Staff::TwentySevenForm
  include ActiveModel::Model

  attr_accessor :twenty_seven 
  delegate :persisted?, :save, to: :twenty_seven
  
  def initialize(twenty_seven = nil)
    @twenty_seven = twenty_seven
    @twenty_seven ||= TwentySeven.new
  end
  
  def assign_attributes(params = {})
    @params = params
    twenty_seven.assign_attributes(twenty_seven_params)
  end
  
  private
  def twenty_seven_params
    @params.require(:twenty_seven).permit(:m_1, :m_2, :m_3, :c_1, :m_4, :m_5, :m_6, :c_2, :m_7, :m_8, :m_9, :c_3, :m_10, :m_11, :m_12, :c_4, :transfer_m_1, :transfer_m_2, :transfer_m_3, :transfer_c_1, :transfer_m_4, :transfer_m_5, :transfer_m_6, :transfer_c_2, :transfer_m_7, :transfer_m_8, :transfer_m_9, :transfer_c_3, :transfer_m_10, :transfer_m_11, :transfer_m_12, :transfer_c_4, :pt_special_1, :pt_special_2, :pt_special_3, :pt_special_4, :pt_special_5, :pt_special_6, :pt_special_7, :pt_special_8, :pt_special_9, :pt_special_10, :pt_special_11, :pt_special_12)
  end
end