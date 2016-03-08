class Category < ActiveRecord::Base
  
  has_many :categorizations
  has_many :products, through: :categorizations

  def to_s
    name
  end

end