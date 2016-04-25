class Changecolumnnameissues < ActiveRecord::Migration
  def change
  	rename_column :issues, :issuedecription, :issuedescription
  end
end
