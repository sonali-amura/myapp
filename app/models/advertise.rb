class Advertise
  include Mongoid::Document
  include Mongoid::Paperclip
  belongs_to :user

  field :title, type: String
  field :started_at, type: Date
	field :description, type: String
	field :expiry_date, type: Date
  field :category, type: String
  field :location, type: String
  field :area, type: String
  field :creator, type: String
  has_mongoid_attached_file :avatar,
  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename",
  :styles => { :small => "100x50", :medium => "300x200" }
  validates :title, :category, :location, :area, presence: true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # attr_accessor :image
end
