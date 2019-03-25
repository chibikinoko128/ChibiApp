class Staff::StaffYearForm
  include ActiveModel::Model

  attr_accessor :staff_year 
  delegate :persisted?, :save, to: :staff_year
  
  def initialize(staff_year = nil)
    @staff_year = staff_year
    @staff_year ||= StaffYear.new
  end
  
  def assign_attributes(params = {})
    @params = params
    staff_year.assign_attributes(year_params)
  end
  
  private
  def year_params
    @params.require(:staff_year).permit(:year_check)
  end
end