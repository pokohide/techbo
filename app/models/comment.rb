class Comment < ApplicationRecord
  belongs_to :entry, touch: true

  validates :from, presence: true
  validates :body, presence: true
end
