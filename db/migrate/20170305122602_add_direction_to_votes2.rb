class AddDirectionToVotes2 < ActiveRecord::Migration
  def change
  	add_column :votes, :direction, :boolean
  end
end
