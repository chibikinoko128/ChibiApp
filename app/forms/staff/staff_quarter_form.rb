class Staff::StaffQuarterForm
  include ActiveModel::Model

  attr_accessor :staff_quarter
  delegate :persisted?, :save, to: :staff_quarter
  
  def initialize(staff_quarter = nil)
    @staff_quarter = staff_quarter
    @staff_quarter ||= StaffQuarter.new
  end
  
  def assign_attributes(params = {})
    @params = params
    staff_quarter.assign_attributes(quarter_params)
  end
  
  private
  def quarter_params
    @params.require(:staff_quarter).permit(:bonus_year, :bonus_quarter)
  end
end