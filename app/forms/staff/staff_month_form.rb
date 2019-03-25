class Staff::StaffMonthForm
  include ActiveModel::Model

  attr_accessor :staff_month
  delegate :persisted?, :save, to: :staff_month
  
  def initialize(staff_month = nil)
    @staff_month = staff_month
    @staff_month ||= StaffMonth.new
  end
  
  def assign_attributes(params = {})
    @params = params
    staff_month.assign_attributes(month_params)
  end
  
  private
  def month_params
    @params.require(:staff_month).permit(:retrieval_year, :retrieval_month)
  end
end