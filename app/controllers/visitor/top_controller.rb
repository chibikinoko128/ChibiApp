class Visitor::TopController < Visitor::Base
  def index
    render action: 'open'
  end
  
  def open
    render action: 'open'
  end
end
