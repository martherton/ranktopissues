class Subcatforissue < ActiveRecord::Migration
  def change
  	add_column :issues, :subcategory, :string
  end
end
