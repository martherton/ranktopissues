class Addsubcategorytovote < ActiveRecord::Migration
  def change
  	add_column :votes, :subcategory_id, :integer
  end
end
