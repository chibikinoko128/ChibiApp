class Admin::AdminEventsController < Admin::Base
  def index
    if params[:administrator_id]
      @administrator = Administrator.find(params[:administrator_id])
      @events = @administrator.events
    else
      @events = AdminEvent
    end
    @events = @events.order(occurred_at: :desc)
      .includes(:member).page(params[:page])
  end
end
