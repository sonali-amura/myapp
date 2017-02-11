class Advertise
  include Mongoid::Document
  belongs_to :user
  belongs_to :category
  
  field :title, type: String
  field :create_date, type: Date
	field :description, type: String
	field :expiry_date, type: Date	
end
