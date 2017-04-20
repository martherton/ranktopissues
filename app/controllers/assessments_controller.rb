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

  def edit
  	if current_user.admin?
  		@issue = Issue.find(params[:issue_id])
  		@assessment = @issue.assessments.find(params[:id])
  	else
  		redirect_to root_path
  	end		
  end
  
  def update
  	if current_user.admin?
		
	    
	    @issue = Issue.find(params[:issue_id])
	    @assessment = @issue.assessments.find(params[:id])
	    
	    if @assessment.update_attributes(assessment_params)
	        flash[:success] = "Your Topic was updated"
	        redirect_to issue_path(@issue)
	    else
	      flash[:error] = "Oops. There has been a problem, please retry."
	      render :edit
	    end
	  else
			redirect_to	root_path
		end	  
  end

  def index
  	@assessments = Assessment.all

  end	

  private

  def assessment_params
		params.require(:assessment).permit(:timing, :magnitude, :certainty, :user_id, :issue_id, :subcat_id)
	end	

end
