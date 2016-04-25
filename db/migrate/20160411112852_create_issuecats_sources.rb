class CreateIssuecatsSources < ActiveRecord::Migration
  def change
    create_table :issuecats_sources do |t|
    	t.integer :issuecat_id
    	t.integer :source_id
    end
  end
end
