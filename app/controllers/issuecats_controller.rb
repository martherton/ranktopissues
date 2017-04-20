class IssuecatsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@lists = Issuecat.where(issubcat: false).order('issuecatname asc')
		@subcats = Issuecat.where(issubcat: true).order('issuecatname asc')
		@issues = Issue.last(5)
		@upcoming = Issue.where("datedue <> ''").order('datedue asc').limit(10)
		
	end
	
	def new
		if current_user.admin?
			@user = current_user
    	@issuecat = @user.issuecats.new
    	@maincats = Issuecat.where(issubcat: false)

		else
			redirect_to	root_path
		end	
	end

	

	def create
		if current_user.admin?
				
		    @user = current_user
		    @issuecat = @user.issuecats.new(issuecat_params)
		    
		    if @issuecat.save
		    	flash[:success] = "Your category was created" 

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
		
	end	

	def update
		   
	end

	def destroy

	end

	
	
	def show
		if params[:id] == "q"
			@issues = Issue.joins(:issues_issuecats).where("issuecat_id = ?", Issuecat.find(params[:search][:q]).id) 
			@subcat = Issuecat.find(params[:search][:q])
			@category = Issuecat.find(@subcat.maincat_id)
		else	
			@issues = Issue.joins(:issues_issuecats).where("issuecat_id = ?", Issuecat.find(params[:id]).id) 
			@subcat = Issuecat.find(params[:id])
			@category = Issuecat.find(@subcat.maincat_id)
		end

	end	

	private

	def issuecat_params
    params.require(:issuecat).permit(:issuecatname, :issubcat,:user_id, :maincat_id, {:source_ids => []}, {:issue_ids => []})

	end	
end
