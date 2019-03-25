class Admin::RetrievalsController < Admin::Base
  def show
    @retrieval = current_administrator
    @retrieval = Rrtrievals.find_by(customer_id: current_administrator.id)
  end
  
  def edit
    @retrieval_form = Admin::RetrievalForm.new(Retrieval.find(1))
  end
  
  def update
    @retrieval_form = Admin::RetrievalForm.new(Retrieval.find(1))
    @retrieval_form.assign_attributes(params[:form])
    if @retrieval_form.save
      flash.notice = '検索した実績データです。'
      retrieval = Retrieval.find(1)
      if retrieval.item == "企業実績"
        redirect_to :individual_admin_record
      else
        redirect_to :payment_list_admin_record
      end
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end