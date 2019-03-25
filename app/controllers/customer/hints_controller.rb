class Customer::HintsController < Customer::Base
  def daily
    time = Time.zone.now
    @day = time.day
    @month = time.month
    if @month <= 11
      @usage_fee = @month + 1
    else
      @usage_fee = 1
    end
  end
end
