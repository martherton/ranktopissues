class AddSubcatToAssessment < ActiveRecord::Migration
  def change
  	add_column :assessments, :subcat_id, :integer
  end
end
