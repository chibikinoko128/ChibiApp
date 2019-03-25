class Eighteen < ActiveRecord::Base
  belongs_to :customer
  
  time = Time.zone.now
  now_time = time.year.to_s + '-' + time.month.to_s + '-' + time.day.to_s
  
  NOW_TIME = %w(今日)
  
  TRANSFER = %w(未送金), %w(送金済)
  
  validates :transfer_m_1, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_2, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_3, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_c_1, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_4, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_5, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_6, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_c_2, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_7, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_8, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_9, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_c_3, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_10, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_11, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_m_12, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :transfer_c_4, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  
  validates :sp_transfer_1, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_2, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_3, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_4, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_5, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_6, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_7, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_8, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_9, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_10, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_11, inclusion: { in: %w(未送金 送金済), allow_blank: true }
  validates :sp_transfer_12, inclusion: { in: %w(未送金 送金済), allow_blank: true }
end
