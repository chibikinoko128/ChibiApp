class Admin::RetrievalForm
  include ActiveModel::Model

  attr_accessor :retrieval 
  delegate :persisted?, :save, to: :retrieval
  
  def initialize(retrieval = nil)
    @retrieval = retrieval
    @retrieval ||= Retrieval.new
  end
  
  def assign_attributes(params = {})
    @params = params
    retrieval.assign_attributes(retrieval_params)
  end
  
  private
  def retrieval_params
    @params.require(:retrieval).permit(:year, :month, :item)
  end
end