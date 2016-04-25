class Vote < ActiveRecord::Base
	belongs_to :issue, counter_cache: true
	
	validates :user_id, presence: true
end
