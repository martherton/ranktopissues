class VisitorsController < ApplicationController
	def index
		@issue1 = Issuecat.where("issubcat = ?", true).limit(1).order("RANDOM()")
		@issue1.each do |i|
			@archive1 = Issue.joins(:issues_issuecats).where("issuecat_id = ? AND archive = ?", i.id, true).limit(1).order("RANDOM()")
			@id1 =  i.id
		end 
		@issue2 = Issuecat.where("issubcat = ? AND id <> ?", true, @id1).limit(1).order("RANDOM()")
		@issue2.each do |i|
			@archive2 = Issue.joins(:issues_issuecats).where("issuecat_id = ? AND archive = ?", i.id, true).limit(1).order("RANDOM()")
			@id2= i.id
		end
		@issue3 = Issuecat.where("issubcat = ? AND id <> ? AND id <> ?", true, @id1, @id2).limit(1).order("RANDOM()")
		@issue2.each do |i|
			@archive3 = Issue.joins(:issues_issuecats).where("issuecat_id = ? AND archive = ?", i.id, true).limit(1).order("RANDOM()")
		end
	end	
end
