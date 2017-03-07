class Addpositivevoteissues < ActiveRecord::Migration
  def change
  	add_column :issues, :posvote, :integer
  end
end
