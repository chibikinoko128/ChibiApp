class Admin::CustomerForm
  include ActiveModel::Model

  attr_accessor :customer, :inputs_home_address, :register 
  delegate :persisted?, :save, to: :customer
 
  def initialize(customer = nil)
    @customer = customer
    @customer ||= Customer.new(gender: 'male')
    
    (2 - @customer.personal_phones.size).times do
      @customer.personal_phones.build
    end
    
    self.inputs_home_address = @customer.home_address.present?
    @customer.build_home_address unless @customer.home_address
    
    (2 - @customer.home_address.phones.size).times do
      @customer.home_address.phones.build
    end
    
    @customer.build_register unless @customer.register
    @customer.build_sponsor unless @customer.sponsor
    @customer.build_score unless @customer.score
    @customer.build_eighteen unless @customer.eighteen
    @customer.build_nineteen unless @customer.nineteen
    @customer.build_twentie unless @customer.twentie
    @customer.build_one unless @customer.one
    @customer.build_twenty_two unless @customer.twenty_two
    @customer.build_twenty_three unless @customer.twenty_three
    @customer.build_twenty_four unless @customer.twenty_four
    @customer.build_twenty_five unless @customer.twenty_five
    @customer.build_twenty_six unless @customer.twenty_six
    @customer.build_twenty_seven unless @customer.twenty_seven
    @customer.build_member unless @customer.member
    @customer.build_point unless @customer.point
    @customer.build_special unless @customer.special
    @customer.build_bank unless @customer.bank
    @customer.build_customer_year unless @customer.customer_year
  end
  
  def assign_attributes(params = {})
    @params = params
    self.inputs_home_address = params[:inputs_home_address] == '1'

    customer.assign_attributes(customer_params)
    
    phones = phone_params(:customer).fetch(:phones)
    customer.personal_phones.size.times do |index|
      attributes = phones[index.to_s]
      if attributes && attributes[:number].present?
        customer.personal_phones[index].assign_attributes(attributes)
      else
        customer.personal_phones[index].mark_for_destruction
      end
    end
    
    if inputs_home_address
      customer.home_address.assign_attributes(home_address_params)
      
      phones = phone_params(:home_address).fetch(:phones)
      customer.home_address.phones.size.times do |index|
        attributes = phones[index.to_s]
        if attributes && attributes[:number].present?
          customer.home_address.phones[index].assign_attributes(attributes)
        else
          customer.home_address.phones[index].mark_for_destruction
        end
      end
    else
      customer.home_address.mark_for_destruction
    end
  end

  private
  def customer_params
    @params.require(:customer).permit(
      :email, :password,
      :family_name, :given_name, :family_name_kana, :given_name_kana,
      :birthday, :gender, :nickname, :sponsor1, :lock, :bonus_lock, :special_lock, :member_type
    )
  end

  def home_address_params
    @params.require(:home_address).permit(
      :postal_code, :prefecture, :city, :address1, :address2, :address3
    )
  end
  
  def phone_params(record_name)
    @params.require(record_name).permit(phones: [ :number, :primary ])
  end
  
  def register_params
    @params.require(:register).permit(:rg_1, :rg_2, :rg_3, :rg_4, :rg_5, :rg_6, :rg_7, :rg_8, :rg_9, :rg_10, :rg_11, :rg_12)
  end
end
