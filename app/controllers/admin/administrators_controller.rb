class Admin::AdministratorsController < Admin::Base
  def index
    @administrators = Administrator.order(:email)
      .page(params[:page])
    @admin_id_1 = Administrator.find(1)
  end
  
  def show
    administrator = Administrator.find(params[:id])
    redirect_to [ :edit, :admin, administrator ]
  end
  
  def new
    @administrator = Administrator.new
  end
  
  def edit
    @administrator = Administrator.find(params[:id])
  end
  
  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      flash.notice = '管理者アカウントを新規登録しました。'
      redirect_to :admin_administrators
    else
      render action: 'new'
    end
  end
  
  def update
    @administrator = Administrator.find(params[:id])
    @administrator.assign_attributes(administrator_params)
    if @administrator.save
      flash.notice = '管理者アカウントを更新しました。'
      redirect_to :admin_administrators
    else
      render action: 'edit'
    end
  end
  
  def destroy
    administrator = Administrator.find(params[:id])
    if administrator.deletable?
      administrator.destroy!
      flash.notice = '管理者アカウントを削除しました。'
    else
      flash.alert = 'この管理者アカウントは削除できません。'
    end
    redirect_to :admin_administrators
  end
  
  private
  def administrator_params
    params.require(:administrator).permit(
      :email, :password, :family_name, :given_name,
      :family_name_kana, :given_name_kana, :start_date, :end_date, :suspended
    )
  end
end
