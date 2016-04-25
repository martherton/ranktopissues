class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
    	t.string :issuetitle
    	t.string :category
    	t.text :issuedecription
    	t.text :issueofficialview
    	t.integer :user_id
      t.boolean :officialoverride
      t.timestamps null: false
    end
  end
end
