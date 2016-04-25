class AddArchiveToIssue < ActiveRecord::Migration
  def change
  	add_column :issues, :archive, :boolean
  end
end
