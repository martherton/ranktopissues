class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.integer :issue_id
    	t.integer :user_id
    	t.text :commentbody
      t.timestamps null: false
    end
  end
end
