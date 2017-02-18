class AddLikeCountToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :like_count, :integer, default: 0
  end
end
