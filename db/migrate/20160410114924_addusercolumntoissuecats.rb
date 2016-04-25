class Addusercolumntoissuecats < ActiveRecord::Migration
  def change
  	add_column :issuecats, :user_id, :integer
  end
end
