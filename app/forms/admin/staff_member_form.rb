class Admin::StaffMemberForm
  include ActiveModel::Model

  attr_accessor :staff_member 
  delegate :persisted?, :save, to: :staff_member
  
  def initialize(staff_member = nil)
    @staff_member = staff_member
    @staff_member ||= StaffMember.new
    
    @staff_member.build_staff_year unless @staff_member.build_staff_year
  end
  
  def assign_attributes(params = {})
    @params = params
    staff_member.assign_attributes(staff_member_params)
  end
  
  private
  def staff_member_params
    @params.require(:staff_member).permit(:email, :family_name, :given_name, :family_name_kana, :given_name_kana, :password)
  end
end