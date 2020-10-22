class Photo < ApplicationRecord
  belongs_to :user
  attachment :image
  default_scope -> { self.order(created_at: :desc) }
end
