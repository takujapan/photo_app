class Photo < ApplicationRecord
  belongs_to :user
  has_many   :likes, dependent: :destroy
  has_many   :comments
  attachment :image
  default_scope -> { self.order(created_at: :desc) }
  
  with_options presence: true do
    validates :image
    validates :caption
  end
end
