class AddAttachmentSourcepdfToSources < ActiveRecord::Migration
  def self.up
    change_table :sources do |t|
      t.attachment :sourcepdf
    end
  end

  def self.down
    remove_attachment :sources, :sourcepdf
  end
end
