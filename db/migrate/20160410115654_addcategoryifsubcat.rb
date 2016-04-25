class Addcategoryifsubcat < ActiveRecord::Migration
  def change
  	add_column :issuecats, :maincat_id, :integer
  end
end
