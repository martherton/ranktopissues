class VotesController < ApplicationController
	def create

		@issue = Issue.find(params[:issue_id])
		@user = current_user
		@votecheck = Vote.where("issue_id =?  AND user_id = ?", @issue.id, @user.id)
		if @votecheck.blank?
			@vote = @issue.votes.new(issue_id: @issue.id, user_id: @user.id)
			@vote.save
		else	
			flash[:error] = "You have already voted for this issue"
		end
		redirect_to issuecat_path(@issue.subcategory)

	end	

	private

	def vote_params
    params.require(:vote).permit(:issue_id, :user_id)

	end	
end
