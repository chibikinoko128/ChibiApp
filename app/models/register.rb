class Register < ActiveRecord::Base
  belongs_to :customer
  
  EXISTENCE = %w(在籍), %w(退会)
  validates :rg_1, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_2, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_3, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_4, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_5, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_6, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_7, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_8, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_9, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_10, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_11, inclusion: { in: %w(在籍 退会), allow_blank: true }
  validates :rg_12, inclusion: { in: %w(在籍 退会), allow_blank: true }
end
