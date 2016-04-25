class Alterstringtointegerinissues < ActiveRecord::Migration
  def change
  	change_column :issues, :category, :integer
  	change_column :issues, :subcategory, :integer
  end
end
