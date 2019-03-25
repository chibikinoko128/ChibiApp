class Admin::AdmissionForm
  include ActiveModel::Model

  attr_accessor :admission 
  delegate :persisted?, :save, to: :admission
  
  def initialize(admission = nil)
    @admission = admission
    @admission ||= Admission.new
  end
  
  def assign_attributes(params = {})
    @params = params
    admission.assign_attributes(admission_params)
  end
  
  private
  def admission_params
    @params.require(:admission).permit(:entries_year, :entries_month, :entries_day)
  end
end