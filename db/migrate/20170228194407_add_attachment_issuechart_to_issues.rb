class AddAttachmentIssuechartToIssues < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.attachment :issuechart
    end
  end

  def self.down
    remove_attachment :issues, :issuechart
  end
end
