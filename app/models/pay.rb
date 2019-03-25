class Pay < ActiveRecord::Base
  
  PAY_YEAR = %w(2018), %w(2019), %w(2020), %w(2021), %w(2022), %w(2023), %w(2024), %w(2025), %w(2026), %w(2027)
  
  PAY_MONTH = %w(1), %w(2), %w(3), %w(4), %w(5), %w(6), %w(7), %w(8), %w(9), %w(10), %w(11), %w(12)
  
  PAY_QUARTER = %w(0), %w(1), %w(2), %w(3), %w(4)
end
