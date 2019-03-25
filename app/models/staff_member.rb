class StaffMember < ActiveRecord::Base
  include EmailHolder
  include PersonalNameHolder
  include PasswordHolder
  
  has_many :events, class_name: 'StaffEvent', dependent: :destroy
  has_many :programs, foreign_key: 'registrant_id',
    dependent: :restrict_with_exception
  
  validates :start_date, presence: true, date: {
    after_or_equal_to: Date.new(2000, 1, 1),
    before: ->(obj) { 1.year.from_now.to_date },
    allow_blank: true
  }
  validates :end_date, date: {
    after: :start_date,
    before: ->(obj) { 1.year.from_now.to_date },
    allow_blank: true
  }
  
  def active?
    !suspended? && start_date <= Date.today &&
    (end_date.nil? || end_date > Date.today)
  end
  
  def deletable?
    programs.empty?
  end
  
  #after_create :create_staff_year
  
  #private
  #def create_staff_year
    #self.create_staff_year(staff_member_id: 6, year_check: 2018)
  #end
end
