class AddAttachmentImageToUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      t.has_attached_file :avater
    end
  end

  def self.down
    drop_attached_file :users, :avater
  end
end
