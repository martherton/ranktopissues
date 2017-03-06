class AddSourcetoIssueImages < ActiveRecord::Migration
  def change

  	add_column :issues, :imsource, :string
  
  end
end
