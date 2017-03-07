class VotesController < ApplicationController
	before_action :authenticate_user!
	def create
			@issue = Issue.find(params[:issue_id])
				@user = current_user
				@votecheck = Vote.where("issue_id =?  AND user_id = ? AND subcategory_id = ?", @issue.id, @user.id, params[:cat])
				@maxup = Vote.where("issue_id = ? AND user_id = ? AND direction = ? AND subcategory_id = ?", @issue.id, @user.id, true, params[:cat])
				@maxdown = Vote.where("issue_id = ? AND user_id = ? AND direction = ? AND subcategory_id = ?", @issue.id, @user.id, false, params[:cat])
				if @votecheck.blank?
				else		
					@lastvote = @votecheck.last.direction
				end	
			if params[:dir] == "1"
				if @votecheck.blank?
					@vote = @issue.votes.new(issue_id: @issue.id, user_id: @user.id, direction: true, subcategory_id: params[:cat])
					@vote.save
					Issue.increment_counter(:posvote, @issue.id)
				elsif @maxup.size < 2 && @lastvote == false
					@vote = @issue.votes.new(issue_id: @issue.id, user_id: @user.id, direction: true, subcategory_id: params[:cat])
					@vote.save
					Issue.decrement_counter(:negvote, @issue.id)
					Issue.increment_counter(:posvote, @issue.id)
				else	
					flash[:error] = "You can't vote this way again"
				end
			elsif params[:dir] == "0"
				@issue = Issue.find(params[:issue_id])
				@user = current_user
				
				if @votecheck.blank?
					@vote = @issue.votes.new(issue_id: @issue.id, user_id: @user.id, direction: false, subcategory_id: params[:cat])
					@vote.save
					Issue.increment_counter(:negvote, @issue.id)
				elsif @maxdown.size < 2 && @lastvote == true
					@vote = @issue.votes.new(issue_id: @issue.id, user_id: @user.id, direction: false, subcategory_id: params[:cat])
					@vote.save	
					Issue.increment_counter(:negvote, @issue.id)
					Issue.decrement_counter(:posvote, @issue.id)
				else	
					flash[:error] = "You can't vote this way again"
				end
			end	
		 if params[:iss].blank?
				redirect_to issuecat_path(params[:cate])
			else
				redirect_to issue_path(params[:iss])
			end	
	end	
 
	 

	private

	def vote_params
    params.require(:vote).permit(:issue_id, :user_id, :direction, :subcategory_id)

	end	
end
