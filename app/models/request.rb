class Request < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :category_id, presence: true

	has_attached_file :support, url: "/marketissuespdf/requests/:hash.:extension", hash_secret: "longSecretString", :path =>"/marketissuesrequests/source/:hash.:extension"
  validates_attachment_content_type :support, content_type: /\Aapplication/
  validates_attachment_file_name :support, matches: [/pdf\z/] 
end
