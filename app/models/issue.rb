class Issue < ActiveRecord::Base
	extend FriendlyId
  friendly_id :issuetitle, use: [:finders]
	
	belongs_to :user
	has_and_belongs_to_many :issuecats
	has_many :sources
	has_many :comments
	has_many :votes

	validates :user_id, presence: true
	validates :issuetitle, presence: true, uniqueness: true
	has_attached_file :issuechart, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",  url: "/marketissuescharts/issues/:hash.:extension", hash_secret: "longSecretString", :path =>"/marketissuescharts/issues/:hash.:extension"
  # Validate content type
  validates_attachment_content_type :issuechart, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :issuechart, matches: [/png\z/, /jpg\z/, /JPG\z/, /gif\z/, /jpeg\z/]
  

end
