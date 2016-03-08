class Product < ActiveRecord::Base

  has_many :categorizations
  has_many :categories, through: :categorizations
  attr_accessor :new_category
  after_save :create_category

  def new_category
    self.categories.collect do |cat|
      cat.name
    end
  end

  def create_category
    if new_category.present?
      new_category1=Category.create(name: new_category)
      self.categories = [new_category1]
    else
      self.category_ids = category_ids
    end
  end
end