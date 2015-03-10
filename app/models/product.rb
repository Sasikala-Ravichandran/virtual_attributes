class Product < ActiveRecord::Base
	has_many :categorizations
	has_many :categories, through: :categorizations
    #attr_accessor :new_category
    #after_save :create_category
     
 #when we are in edit page auto fill of text_field is done by getter method.
def new_category 
	self.categories.collect do |cat|
	cat.name
end
end
 def new_category=(category)
 	 
 	if category.present?
 		new_category=Category.create(name: category) 
        self.categories = [new_category]
    else
    	self.category_ids = category_ids
    end
 end
=begin 
 def create_category
 	if category.present?
 		new_category=Category.create(name: category) 
        self.categories = [new_category]
    else
    	self.category_ids = category_ids
    end
 end
=end
end
