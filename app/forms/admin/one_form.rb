class Admin::OneForm
  include ActiveModel::Model

  attr_accessor :one 
  delegate :persisted?, :save, to: :one
  
  def initialize(one = nil)
    @one = one
    @one ||= One.new
  end
  
  def assign_attributes(params = {})
    @params = params
    one.assign_attributes(one_params)
  end
  
  private
  def one_params
    @params.require(:one).permit(:m_1, :m_2, :m_3, :c_1, :m_4, :m_5, :m_6, :c_2, :m_7, :m_8, :m_9, :c_3, :m_10, :m_11, :m_12, :c_4, :transfer_m_1, :transfer_m_2, :transfer_m_3, :transfer_c_1, :transfer_m_4, :transfer_m_5, :transfer_m_6, :transfer_c_2, :transfer_m_7, :transfer_m_8, :transfer_m_9, :transfer_c_3, :transfer_m_10, :transfer_m_11, :transfer_m_12, :transfer_c_4, :pt_special_1, :pt_special_2, :pt_special_3, :pt_special_4, :pt_special_5, :pt_special_6, :pt_special_7, :pt_special_8, :pt_special_9, :pt_special_10, :pt_special_11, :pt_special_12, :sp_transfer_1, :sp_transfer_2, :sp_transfer_3, :sp_transfer_4, :sp_transfer_5, :sp_transfer_6, :sp_transfer_7, :sp_transfer_8, :sp_transfer_9, :sp_transfer_10, :sp_transfer_11, :sp_transfer_12, :cache_payment_1, :cache_payment_2, :cache_payment_3, :cache_payment_4, :bonus_payment_1, :cache_payment_4, :cache_payment_5, :cache_payment_6, :bonus_payment_2, :cache_payment_7, :cache_payment_8, :cache_payment_9, :bonus_payment_3, :cache_payment_10, :cache_payment_11, :cache_payment_12, :special_payment_1, :special_payment_2, :special_payment_3, :special_payment_4, :special_payment_5, :special_payment_6, :special_payment_7, :special_payment_8, :special_payment_9, :special_payment_10, :special_payment_11, :special_payment_12)
  end
end