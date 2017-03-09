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

  def download 
    @source = Source.find(params[:sid])
    
    data = open(@source.sourcepdf.expiring_url(10)) 
      send_data data.read, filename: "{@source.extradescription}.pdf", type: "application/pdf", disposition: 'inline', stream: 'true', buffer_size: '4096' 
  end

private

	def find_issue
  		@issue = Issue.find(params[:issue_id])
	end

	def source_params
		params.require(:source).permit(:sourceurl, :extradescription, :qualityofsource, :user_id, :sourcepdf, :issue_id, {:issuecat_ids => []})
	end	
end
