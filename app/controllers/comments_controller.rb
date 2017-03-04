class CommentsController < ApplicationController
	before_action :find_issue, only:[:new, :create]
  before_action :authenticate_user!
  def new
  	@comment = @issue.comments.new
  end

  def create
  	@comment = @issue.comments.new(comment_params)
  	@comment.save
  	redirect_to issue_path(@issue)
  end

private

	def find_issue
  		@issue = Issue.find(params[:issue_id])
	end

	def comment_params
		params.require(:comment).permit(:commentbody, :user_id, :issue_id)
	end	
end
