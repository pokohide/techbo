class AddAttachmentImageToEntries < ActiveRecord::Migration[5.0]
  def up
    add_attachment :entries, :image
  end

  def down
    remove_attachment :entries, :image
  end
end
