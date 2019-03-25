class Customer::NumbersController < Customer::Base
  def edit
    @number_form = Customer::NumberForm.new(Number.find(1))
  end
  
  def update
    @number_form = Customer::NumberForm.new(Number.find(1))
    @number_form.assign_attributes(params[:form])
    if @number_form.save
      flash.notice = '検索した動画です。'
      redirect_to :back_number_customer_video
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
