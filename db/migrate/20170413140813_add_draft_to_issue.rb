class AddDraftToIssue < ActiveRecord::Migration
  def change
  	add_column :issues, :draft, :boolean
  end
end
