class HomeAddress < Address
  validates :postal_code, :prefecture, :city, :address1, presence: true
  #validates :division_name, absence: true
end