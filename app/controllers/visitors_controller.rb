class VisitorsController < ApplicationController
	def index
		@issuecount = Issuecat.count
		@user = current_user
		if @issuecount.blank?
		else	
			@issuecats = Issuecat.where("issubcat = ?", true).order("RANDOM()")
			
			
			@issueran = Array.new
			@issuetitle = Array.new
			@issueimage = Array.new
			@issuecats.each do |issuecat|
				@issue = Issue.where.not(issuechart_file_name: "").where("subcategory = ?", issuecat.id).order("RANDOM()").limit(1)
				@issue.each do |issue|
					@issueran = @issueran.push(Issuecat.find(issue.subcategory).issuecatname)
					@issuetitle = @issuetitle.push(Issue.find(issue.id).issuetitle)
					@issueimage = @issueimage.push(Issue.find(issue.id).issuechart)
				end
			end
			
			
		
			
		end
	end	

	def voting

	end
	
	def vip

	end

	def about

	end	
end
