class User < ApplicationRecord
  devise :database_authenticatable,   :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many   :photos, dependent: :destroy
  has_many   :likes,  dependent: :destroy
  validates :username, presence: true
  has_many :active_relationships,  class_name: 'Follow', foreign_key: 'user_id'
  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_user_id'
  has_many :followings, through: :active_relationships,  source: :target_user
  has_many :followers, through:  :passive_relationships, source: :user
  has_many :comments
  
  def already_liked?(photo)
    self.likes.exists?(photo_id: photo.id)
  end
end
