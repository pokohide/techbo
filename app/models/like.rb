class Like < ApplicationRecord
  belongs_to :entry
  counter_culture :entry
  belongs_to :user
end
