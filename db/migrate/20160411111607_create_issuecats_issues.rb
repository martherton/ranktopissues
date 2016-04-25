class CreateIssuecatsIssues < ActiveRecord::Migration
  def change
    create_table :issuecats_issues do |t|
    	t.integer :issuecat_id
    	t.integer :issue_id
    end
  end
end
