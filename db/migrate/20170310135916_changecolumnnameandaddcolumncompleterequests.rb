class Changecolumnnameandaddcolumncompleterequests < ActiveRecord::Migration
  def change
  	add_column :requests, :complete, :boolean
  	rename_column :requests, :subcateory_id, :subcategory_id
  end
end
