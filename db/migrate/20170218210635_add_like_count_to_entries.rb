class AddLikeCountToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :likes_count, :integer, default: 0
  end
end
