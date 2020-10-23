class User < ApplicationRecord
  devise :database_authenticatable,   :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many   :photos, dependent: :destroy
  has_many   :likes,  dependent: :destroy
  validates :username, presence: true
  
  def already_liked?(photo)
    self.likes.exists?(photo_id: photo.id)
  end
end
