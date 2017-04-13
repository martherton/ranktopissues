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

  def index
    if current_user.admin?
      @comments = Comment.where(updated_at: (Time.now - 72.hours)..Time.now)
      @votes = Vote.where(updated_at: (Time.now - 72.hours)..Time.now).group('issue_id','direction','subcategory_id').order('count_id desc').count('id')
    else
      redirect_to root_path
    end
  end  

private

	def find_issue
  		@issue = Issue.find(params[:issue_id])
	end

	def comment_params
		params.require(:comment).permit(:commentbody, :user_id, :issue_id)
	end	
end
