class AddUidToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :uid, :string
  end
end
