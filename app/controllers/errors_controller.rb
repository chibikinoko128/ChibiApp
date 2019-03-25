class ErrorsController < ApplicationController
  def routing_error
    Rails.logger.info request.host
    raise ActionController::RoutingError,
      "No route matches #{request.path.inspect}"
  end
end
