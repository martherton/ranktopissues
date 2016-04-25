class Issue < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :issuecats
	has_many :sources
	has_many :comments
	has_many :votes

	validates :user_id, presence: true
	validates :issuetitle, presence: true, uniqueness: true


end
