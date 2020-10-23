class Photo < ApplicationRecord
  belongs_to :user
  attachment :image
  default_scope -> { self.order(created_at: :desc) }
  
  with_options presence: true do
    validates :image
    validates :caption
  end
end
