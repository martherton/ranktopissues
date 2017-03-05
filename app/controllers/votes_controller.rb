class VotesController < ApplicationController
	before_action :authenticate_user!
	def create
			@issue = Issue.find(params[:issue_id])
				@user = current_user
				@votecheck = Vote.where("issue_id =?  AND user_id = ?", @issue.id, @user.id)
				@maxup = Vote.where("issue_id = ? AND user_id = ? AND direction = ?", @issue.id, @user.id, true)
				@maxdown = Vote.where("issue_id = ? AND user_id = ? AND direction = ?", @issue.id, @user.id, false)
				if @votecheck.blank?
				else		
					@lastvote = @votecheck.last.direction
				end	
			if params[:dir] == "1"
				if @votecheck.blank?
					@vote = @issue.votes.new(issue_id: @issue.id, user_id: @user.id, direction: true)
					@vote.save
				elsif @maxup.size < 2 && @lastvote == false
					@vote = @issue.votes.new(issue_id: @issue.id, user_id: @user.id, direction: true)
					@vote.save
				else	
					flash[:error] = "You can't vote this way again"
				end
			elsif params[:dir] == "0"
				@issue = Issue.find(params[:issue_id])
				@user = current_user
				@votecheck = Vote.where("issue_id =?  AND user_id = ?", @issue.id, @user.id)
				if @votecheck.blank?
					@vote = @issue.votes.new(issue_id: @issue.id, user_id: @user.id, direction: false)
					@vote.save
				elsif @maxdown.size < 2 && @lastvote == true
					@vote = @issue.votes.new(issue_id: @issue.id, user_id: @user.id, direction: false)
					@vote.save	
				else	
					flash[:error] = "You can't vote this way again"
				end
			end	
		
		redirect_to issuecat_path(@issue.subcategory)
	end	

	

	private

	def vote_params
    params.require(:vote).permit(:issue_id, :user_id)

	end	
end
