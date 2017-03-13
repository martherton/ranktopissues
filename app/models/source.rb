class Source < ActiveRecord::Base
	belongs_to :issue
	belongs_to :user
	has_and_belongs_to_many :issuecats

	validates :user_id, presence: true
	

	has_attached_file :sourcepdf, url: "/marketissuespdf/source/:hash.:extension", hash_secret: "longSecretString", :path =>"/marketissuespdfs/source/:hash.:extension", style: lambda { |a| a.instance.is_image? ? {thumb: "100x100>"} : {}}
  validates_attachment_content_type :sourcepdf, content_type: [/\Aapplication/, /\Aimage/]
  validates_attachment_file_name :sourcepdf, matches: [/pdf\z/,/png\z/, /jpg\z/, /JPG\z/, /gif\z/, /jpeg\z/] 
end
