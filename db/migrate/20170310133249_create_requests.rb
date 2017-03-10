class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.integer :user_id
    	t.integer :category_id
    	t.integer :subcateory_id
    	t.string :newsubcategory
    	t.text :requestdesc
      t.timestamps null: false
    end
  end
end
