class Comment < ApplicationRecord
  belongs_to :entry, touch: true
end
