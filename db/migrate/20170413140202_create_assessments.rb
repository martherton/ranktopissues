class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
    	t.integer :issue_id
    	t.integer :user_id
    	t.string :timing
    	t.string :magnitude
    	t.string :certainty
      t.timestamps null: false
    end
  end
end
