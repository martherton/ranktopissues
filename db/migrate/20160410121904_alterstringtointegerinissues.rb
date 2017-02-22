class Alterstringtointegerinissues < ActiveRecord::Migration
  def change
  	change_column :issues, :category, 'integer USING CAST(category AS integer)'
  	change_column :issues, :subcategory, 'integer USING CAST(subcategory AS integer)'
  end
end
