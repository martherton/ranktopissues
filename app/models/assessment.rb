class Assessment < ActiveRecord::Base
	belongs_to :user
	belongs_to :issue

	validates_inclusion_of :timing, in: ["None","Positive","Negative","Slow Burn Positive","Slow Burn Negative"]
	validates_inclusion_of :magnitude, in: ["None","Positive","Negative","Slow Burn Positive","Slow Burn Negative"]
	validates_inclusion_of :certainty, in: ["None","Positive","Negative","Slow Burn Positive","Slow Burn Negative"]
end
