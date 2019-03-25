class Customer::CustomerYearsController < Customer::Base
  def show
    @customer_year_form = CustomerYear.find_by(customer_id: current_customer.id)
  end
  
  def edit
    @customer_year_form = Customer::CustomerYearForm.new(CustomerYear.find_by(customer_id: current_customer.id))
  end
  
  def update
    @customer_year_form = Customer::CustomerYearForm.new(CustomerYear.find_by(customer_id: current_customer.id))
    @customer_year_form.assign_attributes(params[:form])
    if @customer_year_form.save
      customer_year = CustomerYear.find_by(customer_id: current_customer.id)
      flash.notice = '検索した年度の成績です。'
      if customer_year.year_check == 2018
        redirect_to :customer_eighteen
      elsif customer_year.year_check == 2019
        redirect_to :customer_nineteen
      elsif customer_year.year_check == 2020
        redirect_to :customer_twentie
      elsif customer_year.year_check == 2021
        redirect_to :customer_one
      elsif customer_year.year_check == 2022
        redirect_to :customer_twenty_two
      elsif customer_year.year_check == 2023
        redirect_to :customer_twenty_three
      elsif customer_year.year_check == 2024
        redirect_to :customer_twenty_four
      elsif customer_year.year_check == 2025
        redirect_to :customer_twenty_five
      elsif customer_year.year_check == 2026
        redirect_to :customer_twenty_six
      else
        if customer_year.year_check == 2027
          redirect_to :customer_twenty_seven
        end
      end
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
