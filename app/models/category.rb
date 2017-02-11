class Category
  include Mongoid::Document
  has_many :advertises
  
  mount_uploader :image, MyAppUploader
  field :name, type: String
  field :sub_category, type: String
  field :location, type: String
  field :area, type: String  
  field :description, type: String
end
