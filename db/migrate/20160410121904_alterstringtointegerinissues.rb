class Alterstringtointegerinissues < ActiveRecord::Migration
  def change
  	change_column :issues, :category, :integer, 'integer USING CAST(column_name AS integer)'
  	change_column :issues, :subcategory, :integer, 'integer USING CAST(column_name AS integer)'
  end
end
