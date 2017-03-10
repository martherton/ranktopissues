class Addmoredetailtouseraccounts < ActiveRecord::Migration
  def change
  	add_column :users, :last_name, :string
  	add_column :users, :commentname, :string
  	rename_column :users, :name, :first_name
  end
end
