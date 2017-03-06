class IssuesController < ApplicationController
	before_filter :authenticate_user!
	respond_to :json

	def index
		if current_user.admin?
			@issue = Issue.all.order("created_at")
		else
			redirect_to root_path
		end	
	end
	
	def new
		if current_user.admin?
			@user = current_user
    	@issue = @user.issues.new
    	@category = Issuecat.where(issubcat: false)
    	@subcat = Issuecat.where(issubcat: true)
    	@subcatex = Issuecat.where("issubcat = ?", true )
		else
			redirect_to	root_path
		end	
	end


	def create
		if current_user.admin?
				
		    @user = current_user
		    @issue = @user.issues.new(issue_params)
		    if @issue.save
		    	flash[:success] = "Your issue was created" 

		    	respond_to do |format|
  				format.html { redirect_to :back }
  				format.json { head :no_content }
  			end
		  	else
		  		flash[:failure] = "Check the input"
		    	render :new
		   	end 
		else
			redirect_to	root_path
		end	   	
	end

	def edit
		if current_user.admin? 

	    @user = current_user
	    @issue = @user.issues.find(params[:id])
	    @category = Issuecat.where(issubcat: false)
    	@subcat = Issuecat.where(issubcat: true)
    	@subcatex = Issuecat.where("issubcat = ?", true )
    	@subcatch = Issuecat.includes(:issues).where("id = ?", params[:id])
    	@subbcat = []
    	#@subcatch.each do |subcatch|
    		#@subbcat = @subbcat.push subcatch.id
    	#end	
	  else
			redirect_to	root_path
	  end  
	end	

	def update
		if current_user.admin?
		
	    @user = current_user
	    @issue = @user.issues.find(params[:id])
	    
	    if @issue.update_attributes(issue_params)
	        flash[:success] = "Your Topic was updated"
	        redirect_to issue_path(params[:id])
	    else
	      flash[:error] = "Oops. There has been a problem, please retry."
	      render :edit
	    end
	  else
			redirect_to	new_user_find_path(current_user.id)
		end	   
	end

	def destroy

	end

	
	
	def show
		@issue = Issue.find(params[:id])
		@comments = @issue.comments.all
		@sources = @issue.sources.all
	end	

	
	def update_categories
		@categories = Issuecat.where("maincat_id = ?", params[:maincat_id])
		respond_to do |format|
			format.js
		end	
	end	
  

	private

	def issue_params
    params.require(:issue).permit(:issuetitle, :category, :subcategory, :issuedescription, :issueofficialview, :user_id, :issuechart, :officialoverride, :imsource, :archive, {:issuecat_ids => []})

	end	
end
