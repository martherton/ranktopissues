class Issuecat < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :issues
	has_and_belongs_to_many :sources

	validates :user_id, presence: true
	validates :issuecatname, presence: true, uniqueness: true

end
