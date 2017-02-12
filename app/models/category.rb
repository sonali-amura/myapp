class Category
  include Mongoid::Document
  has_many :advertises
  
  
end
