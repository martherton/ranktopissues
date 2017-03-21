class RequestsController < ApplicationController
	before_filter :authenticate_user!
	

	def index
		if current_user.admin?
			@requests = Request.all.order(complete: :asc, created_at: :desc)
		elsif current_user.vip?
			@requests = Request.where('user_id = ?', current_user.id).order(complete: :asc, created_at: :desc)
		else
			redirect_to root_path
		end			

	end

	def new
		if current_user.vip?
			@user = current_user
			@request = @user.requests.new
			@category = Issuecat.where(issubcat: false)
    	@subcat = Issuecat.where(issubcat: true)
    	
		else
			redirect_to root_path
		end		
	end	
	
	def create
		if current_user.vip?
			@user = current_user
			@request = @user.requests.new(request_params)
			if @request.save
		    	flash[:success] = "Thank you. Your request has been sent." 
		    	UserMail.requestsend(@request).deliver
		    	respond_to do |format|
  				format.html { redirect_to requests_path }
  				format.json { head :no_content }

  			end
		  	else
		  		flash[:failure] = "Please check your request for errors"
		    	render :new
		   	end 
		else
			redirect_to	root_path
		end	   	
	end

	def edit
		if current_user.vip? 

	    @user = current_user
	    @request = @user.requests.find(params[:id])
	  else
			redirect_to	root_path
	  end   
	end

	def update
		if current_user.vip?
		
	    @user = current_user
	    @request = @user.requests.find(params[:id])
	    
	    if @request.update_attributes(request_params)
	        flash[:success] = "Your Request was updated and sent"
	        redirect_to requests_path
	    else
	      flash[:error] = "Oops. There has been a problem, please retry."
	      render :edit
	    end
	  elsif current_user.admin?
	  	@userid = Request.find(params[:id])
	  	@user = User.find(@userid.user_id)
	    @request = @user.requests.find(params[:id])
	  	@request.update(complete: true)
	  	redirect_to requests_path
	  else	
			redirect_to	root_path
		end	
	end	

	def destroy
		if current_user.vip?
			@request = Request.find(params[:id])
	    @request.destroy
	    redirect_to requests_path, :notice => "Request deleted."
	  else
			redirect_to	root_path
		end	  
	end	

	def update_subcategories
		@subcategories = Issuecat.where("maincat_id = ?", params[:maincat_id])
		respond_to do |format|
			format.js
		end	
	end



	private

	def request_params
		params.require(:request).permit(:category_id, :subcategory_id, :requestdesc, :support, :user_id, :newsubcategory, :complete, :newsub )
	end	
end
