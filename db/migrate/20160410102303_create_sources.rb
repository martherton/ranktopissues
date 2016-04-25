class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
    	t.integer :user_id
    	t.integer :issue_id
    	t.string :sourceurl
    	t.text :extradescription
    	t.string :qualityofsource
      t.timestamps null: false
    end
  end
end
