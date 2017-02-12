class Advertise
  include Mongoid::Document
  belongs_to :user
  # mount_uploader :image, MyAppUploader
  field :title, type: String
  field :started_at, type: Date
	field :description, type: String
	field :expiry_date, type: Date
  field :category, type: String
  field :location, type: String
  field :area, type: String 
end
