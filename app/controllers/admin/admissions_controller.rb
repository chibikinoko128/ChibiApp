class Admin::AdmissionsController < Admin::Base
  def show
    @admission = current_administrator
    @admission = Admission.find_by(cutomer_id: current_administrator.id)
  end
  
  def edit
    @admission_form = Admin::AdmissionForm.new(Admission.find(1))
  end
  
  def update
    @admission_form = Admin::AdmissionForm.new(Admission.find(1))
    @admission_form.assign_attributes(params[:form])
    if @admission_form.save
      flash.notice = '検索した新規会員登録者です。'
      redirect_to :day_admission_admin_record
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
