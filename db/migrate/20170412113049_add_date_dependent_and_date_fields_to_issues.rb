class AddDateDependentAndDateFieldsToIssues < ActiveRecord::Migration
  def change
  	add_column :issues, :dated, :boolean
  	add_column :issues, :datedue, :date
  end
end
