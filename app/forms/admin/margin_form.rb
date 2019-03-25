class Admin::MarginForm
  include ActiveModel::Model

  attr_accessor :margin 
  delegate :persisted?, :save, to: :margin
  
  def initialize(margin = nil)
    @margin = margin
    @margin ||= Margin.new
  end
  
  def assign_attributes(params = {})
    @params = params
    margin.assign_attributes(margin_params)
  end
  
  private
  def margin_params
    @params.require(:margin).permit(:year, :month)
  end
end