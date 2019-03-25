class Admin::ChoiceForm
  include ActiveModel::Model
  
  attr_accessor :choice
  delegate :persisted?, :save, to: :choice
  
  def initialize(choice = nil)
    @choice = choice
    @choice ||= Choice.new
  end
  
  def assign_attributes(params = {})
    @params = params
    choice.assign_attributes(choice_params)
  end
  
  private
  def choice_params
    @params.require(:choice).permit(:detection, :remuneration)
  end
end