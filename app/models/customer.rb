class Customer < ActiveRecord::Base
  include EmailHolder
  include PersonalNameHolder
  include PasswordHolder
  
  #has_many :addresses, dependent: :destroy
  has_one :home_address, dependent: :destroy, autosave: true
  has_one :bank, dependent: :destroy, autosave: true
  has_one :register, dependent: :destroy, autosave: true
  has_one :special, dependent: :destroy, autosave: true
  has_one :point, dependent: :destroy, autosave: true
  has_one :member, dependent: :destroy, autosave: true
  has_one :seventeen, dependent: :destroy, autosave: true
  has_one :eighteen, dependent: :destroy, autosave: true
  has_one :nineteen, dependent: :destroy, autosave: true
  has_one :twentie, dependent: :destroy, autosave: true
  has_one :one, dependent: :destroy, autosave: true
  has_one :twenty_two, dependent: :destroy, autosave: true
  has_one :twenty_three, dependent: :destroy, autosave: true
  has_one :twenty_four, dependent: :destroy, autosave: true
  has_one :twenty_five, dependent: :destroy, autosave: true
  has_one :twenty_six, dependent: :destroy, autosave: true
  has_one :twenty_seven, dependent: :destroy, autosave: true
  has_one :customer_year, dependent: :destroy, autosave: true
  has_one :score, dependent: :destroy, autosave: true
  has_one :sponsor, dependent: :destroy, autosave: true
  has_many :phones, dependent: :destroy
  has_many :personal_phones, -> { where(address_id: nil).order(:id) },
    class_name: 'Phone', autosave: true
  has_many :entries, dependent: :destroy
  has_many :programs, through: :entries
  has_many :messages
  has_many :outbound_messages, class_name: 'CustomerMessage',
    foreign_key: 'customer_id'
  has_many :inbound_messages, class_name: 'StaffMessage',
    foreign_key: 'customer_id'
  
  MEMBER_TYPE = %w(一般会員), %w(特別会員)
  LOCK = %w(0), %w(1)

  validates :gender, inclusion: { in: %w(male female), allow_blank: true }
  validates :birthday, date: {
    after: Date.new(1900, 1, 1),
    before: ->(obj) { Date.today },
    allow_blank: true
  }

  validates :nickname, uniqueness: { allow_blank: true }
  
  if Customer.ids.length <= 2
    validates :sponsor1, inclusion: { in: %W(sss dragon) }
  else
    validates :sponsor1, inclusion: { in: Customer.select("nickname").pluck(:nickname) }
  end
      
  before_save do
    if birthday
      self.birth_year = birthday.year
      self.birth_month = birthday.month
      self.birth_mday = birthday.mday
    end
  end
end
