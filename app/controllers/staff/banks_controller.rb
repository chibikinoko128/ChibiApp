class Staff::BanksController < Staff::Base
  def index
    render action: 'index'
  end
  
  def show
    render action: 'show'
  end
  
  def new
    render action: 'new'
  end
    
  def edit
    render action: 'edit'
  end
  
  def create
    render action: 'create'
  end

  def update
    render action: 'update'
  end
  
  def destroy
    render action: 'destroy'
  end
  
  private
  def bank_params
    params.require(:bank).permit(
      :bk_name, :office, :account
    )
  end
end
