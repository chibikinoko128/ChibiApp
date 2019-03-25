class Customer::YearsController < Customer::Base
  def show
    @pay = Year.find(1)
  end
  
  def edit
    @year_form = Customer::YearForm.new(Year.find(1))
  end
  
  def update
    @year_form = Customer::YearForm.new(Year.find(1))
    @year_form.assign_attributes(params[:form])
    if @year_form.save
      flash.notice = '検索した年度の成績です。'
      if @year_form.year == 2018
        redirect_to :customer_eighteen
      elsif @year_form.year == 2019
        redirect_to :customer_nineteen
      elsif @year_form.year == 2020
        redirect_to :customer_twentie
      elsif @year_form.year == 2021
        redirect_to :customer_one
      elsif @year_form.year == 2022
        redirect_to :customer_twenty_two
      elsif @year_form.year == 2023
        redirect_to :customer_twenty_three
      elsif @year_form.year == 2024
        redirect_to :customer_twenty_four
      elsif @year_form.year == 2025
        redirect_to :customer_twenty_five
      elsif @year_form.year == 2026
        redirect_to :customer_twenty_six
      else
        if @year_form.year == 2027
          redirect_to :customer_twenty_seven
        end
      end
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'edit'
    end
  end
end
