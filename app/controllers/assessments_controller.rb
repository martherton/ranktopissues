class AssessmentsController < ApplicationController

	def new
		if current_user.admin?

			@issue = Issue.find(params[:issue_id])
			@subcat = @issue.issuecats
				@subcats = []
				@subcat.each do |s|
					@test = Assessment.where("subcat_id = ? and issue_id = ?", s.id, @issue.id).count
					if @test < 1
						@subcats << s
					else
					end

			  end
			 @assessment = @issue.assessments.new
			


		else
			redirect_to root_path
		end		
	end	

	def create
		if current_user.admin?
			@issue = Issue.find(params[:issue_id])
	  	@assessment = @issue.assessments.new(assessment_params)
	  	@assessment.save
  		redirect_to issue_path(@issue)
  	else
  		redirect_to root_path
  	end		
  end

  private

  def assessment_params
		params.require(:assessment).permit(:timing, :magnitude, :certainty, :user_id, :issue_id, :subcat_id)
	end	

end
