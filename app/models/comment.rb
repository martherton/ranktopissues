class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :issue

	validates :user_id, presence: true
	validates :commentbody, presence: true

end
