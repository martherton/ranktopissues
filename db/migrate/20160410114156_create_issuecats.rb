class CreateIssuecats < ActiveRecord::Migration
  def change
    create_table :issuecats do |t|
    	t.string :issuecatname
    	t.boolean :issubcat
      t.timestamps null: false
    end
  end
end
