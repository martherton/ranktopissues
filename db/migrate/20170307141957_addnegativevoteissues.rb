class Addnegativevoteissues < ActiveRecord::Migration
  def change
  	add_column :issues, :negvote, :integer
  end
end
