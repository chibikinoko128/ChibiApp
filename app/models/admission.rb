class Admission < ActiveRecord::Base
  ENTRIES_YEAR = %w(2018), %w(2019), %w(2020), %w(2021), %w(2022), %w(2023), %w(2024), %w(2025), %w(2026), %w(2027)
  
  ENTRIES_MONTH = %w(1), %w(2), %w(3), %w(4), %w(5), %w(6), %w(7), %w(8), %w(9), %w(10), %w(11), %w(12)
  
  ENTRIES_DAY = %w(1), %w(2), %w(3), %w(4), %w(5), %w(6), %w(7), %w(8), %w(9), %w(10), %w(11), %w(12), %w(13), %w(14), %w(15), %w(16), %w(17), %w(18), %w(19), %w(20), %w(21), %w(22), %w(23), %w(24), %w(25), %w(26), %w(27), %w(28), %w(29), %w(30), %w(31), %w(未入金), %w(集計)
end
