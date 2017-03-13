class VisitorsController < ApplicationController
	def index
		@issuecount = Issuecat.count
		@user = current_user
		if @issuecount.blank?
		else	
			@issuecats = Issuecat.where("issubcat = ?", true).order("RANDOM()").limit(3)
			
			
			@issueran = Array.new
			@issuetitle = Array.new
			@issueimage = Array.new
			@issuecats.each do |issuecat|
				@issue = Issue.where.not(issuechart_file_name: "").where("subcategory = ?", issuecat).order("RANDOM()").limit(1)
				@issue.each do |issue|
					@issueran = @issueran.push(Issuecat.find(issue.subcategory).issuecatname)
					@issuetitle = @issuetitle.push(Issue.find(issue).issuetitle)
					@issueimage = @issueimage.push(Issue.find(issue).issuechart)
				end
			end
			
			@issue2 = Issue.order("RANDOM()").limit(1)
			
			@issue3 = Issue.order("RANDOM()").limit(1)
			
			@issueimg = Issue.where.not("issuechart_file_name =?", "").order("RANDOM()").first
		
			
		end
	end	
end
