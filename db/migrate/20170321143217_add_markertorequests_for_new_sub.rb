class AddMarkertorequestsForNewSub < ActiveRecord::Migration
  def change
  	add_column :requests, :newsub, :boolean
  end
end
