class Like < ApplicationRecord
  belongs_to :entry
  counter_culture :entry, column_name: 'like_count'
  belongs_to :user
end
