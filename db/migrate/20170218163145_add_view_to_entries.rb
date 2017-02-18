class AddViewToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :view, :integer, default: 0
  end
end
