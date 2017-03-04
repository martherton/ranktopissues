class SourcesController < ApplicationController
	before_action :authenticate_user!
  before_action :find_issue, only:[:new, :create]

  def new
  	@sourcenew = @issue.sources.new
    @esubcat = Issue.find(params[:issue_id])
    @subcat = Issuecat.where.not("issubcat = ? OR id = ?", false, @esubcat.subcategory)
  end

  def create
  	@source = @issue.sources.new(source_params)
  	@source.save
  	redirect_to issue_path(@issue)
  end

private

	def find_issue
  		@issue = Issue.find(params[:issue_id])
	end

	def source_params
		params.require(:source).permit(:sourceurl, :extradescription, :qualityofsource, :user_id, :issue_id, {:issuecat_ids => []})
	end	
end
