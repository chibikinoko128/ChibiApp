class Admin::AdministratorForm
  include ActiveModel::Model

  attr_accessor :administrator 
  delegate :persisted?, :save, to: :administrator
  
  def initialize(administrator = nil)
    @administrator = administrator
    @administrator ||= Administrator.new
    
    @administrator.build_admin_year unless @administrator.build_admin_year
  end
  
  def assign_attributes(params = {})
    @params = params
    administrator.assign_attributes(administrator_params)
  end
  
  private
  def administrator_params
    @params.require(:administrator).permit(:email, :password, :family_name, :given_name, :family_name_kana, :given_name_kana, :start_date, :end_date, :suspended)
  end
end