class Like < ApplicationRecord
  belongs_to :entry, counter_cache: :likes_count
  belongs_to :user
end
