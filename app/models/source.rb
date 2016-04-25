class Source < ActiveRecord::Base
	belongs_to :issue
	belongs_to :user
	has_and_belongs_to_many :issuecats

	validates :user_id, presence: true
	validates :sourceurl, presence: true, uniqueness: true
end
