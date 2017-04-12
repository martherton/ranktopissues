class ChangeIssueDateToString < ActiveRecord::Migration
  def change
  	change_column :issues, :datedue, :string
  end
end
