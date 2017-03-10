class AddAttachmentSupportToRequests < ActiveRecord::Migration
  def self.up
    change_table :requests do |t|
      t.attachment :support
    end
  end

  def self.down
    remove_attachment :requests, :support
  end
end
